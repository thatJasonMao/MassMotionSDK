/*******************************************************************************

This is a rudimentary example of how you might go about creating custom agent
types that represent things like bicycles, wheelchairs, golf carts or other
things that are not specifically supported by MassMotion. The 'bicycle' agents
are manually controlled to simply plow straight ahead, and other agents have
their behaviour tweaked to attempt to avoid collisions with bicycles in a semi-
realistic way. If built in the default location, run from a command prompt as

	Bicycles.exe ..\..\..\Projects\Bicycles.mm Bicycles.mmdb

This will result in a new Bicycles.mmdb in the current directory; open it
in MassMotion to see the results of the simulation.

*******************************************************************************/

#include <massmotion/all.h>

#include <windows.h>

#include <iostream>
#include <unordered_map>
#include <cassert>

using namespace massmotion;

// Generate a random double value between 0.0 and 1.0
double randomDouble()
{
	return double( std::rand() ) / RAND_MAX;
}

// Generate a random bicycle start point along the -X side of the floor
Vec3d randomStartPoint()
{
	return Vec3d( -14.0, 0.0, -12.0 + 24.0 * randomDouble() );
}

// Generate a random bicycle end point along the +X side of the floor
Vec3d randomEndPoint()
{
	return Vec3d( 14.0, 0.0, -12.0 + 24.0 * randomDouble() );
}

// Helper struct to store a position/velocity
struct Configuration
{
	Configuration( const Vec3d& position, const Vec3d& velocity )
	{
		this->position = position;
		this->velocity = velocity;
	}

	Vec3d position;
	Vec3d velocity;
};

// Possible reactions of an agent to nearby bicycles
enum Reaction
{
	CONTINUE,
	STOP,
	EVADE
};

Reaction singleReaction( const Configuration& agent, const Configuration& bicycle )
{
	Vec3d agentDirection = agent.velocity.GetNormalized();
	Vec3d bicycleDirection = bicycle.velocity.GetNormalized();
	double bicycleSpeed = bicycle.velocity.GetLength();
	Vec3d displacement = agent.position - bicycle.position;
	double distanceAhead = displacement.Dot( bicycleDirection );
	
	if ( distanceAhead < 0.0 || distanceAhead > 2.0 * bicycleSpeed )
	{
		// Agent is behind bicycle or more than 2 seconds ahead
		return CONTINUE;
	}
	else
	{
		Vec3d leftDirection = Vec3d::UP_DIRECTION.Cross( bicycle.velocity ).GetNormalized();
		double offset = displacement.Dot( leftDirection );
		double leftwardsSpeed = agent.velocity.Dot( leftDirection );
		double dangerOffset = 0.5;
		double cautionOffset = 2.0;
		
		if ( std::abs( offset ) > cautionOffset )
		{
			// Far away from the bicycle - continue walking
			return CONTINUE;
		}
		else if ( std::abs( offset ) < dangerOffset )
		{
			// In the path of the bicycle - try to get out of its way
			return EVADE;
		}
		else if ( leftwardsSpeed * offset <= 0 )
		{
			// Approaching the bicycle's path - stop until it passes
			return STOP;
		}
		else
		{
			// Near the bicycle's path but on the far side - continue walking
			return CONTINUE;
		}
	}
}

// Determine the reaction a given agent should have, given all nearby bicycles
Reaction agentReaction( const Configuration& agent, const std::vector<Configuration> bicycles )
{
	Reaction reaction = CONTINUE;

	for ( const Configuration& bicycle: bicycles )
	{
		Reaction currentReaction = singleReaction( agent, bicycle );

		if ( currentReaction == EVADE )
		{
			reaction = EVADE;
			break;
		}
		else if ( currentReaction == STOP )
		{
			reaction = STOP;
		}
	}

	return reaction;
}

int main( int argc, char** argv )
{
	try
	{
		Sdk::Init();

		if ( argc != 3 )
		{
			std::cout << "Run as Bicycle.exe ProjectFilename.mm OutputFilename.mmdb" << std::endl;
			return 1;
		}
	
		ProjectPtr project = Project::Open( argv[ 1 ] );
		
		// Get the full path to the output file
		char outputPath[ 1024 ];
		GetFullPathNameA( argv[ 2 ], 1024, outputPath, NULL );

		ProfilePtr bicycleProfile = project->GetProfile( "BicycleProfile" );
		PortalPtr portalA = project->GetPortal( "PortalA" );
		PortalPtr portalB = project->GetPortal( "PortalB" );
		FloorPtr floor = project->GetFloor( "Floor" );

		SimulationPtr simulation = Simulation::Create( project, "SdkRun", outputPath );

		std::cout << "Running..." << std::endl;

		double frameLength = simulation->GetFrameLength();

		while ( !simulation->IsDone() )
		{
			AgentPtr newBicycleAgent;
			Vec3d newBicycleVelocity;

			// Periodically print the current frame number for progress reporting
			int currentFrame = simulation->GetCurrentFrame();
			if ( currentFrame % 100 == 0 )
			{
				std::cout << "Frame " << currentFrame << std::endl;
			}

			// Spawn a bicycle every five seconds on average
			if ( randomDouble() < simulation->GetFrameLength() / 5.0 )
			{				
				Vec3d startPoint = randomStartPoint();
				Vec3d endPoint = randomEndPoint();
				double speed = 2.0 + 2.0 * randomDouble();

				newBicycleVelocity = speed * ( endPoint - startPoint ).GetNormalized();

				AgentRequest agentRequest( floor->GetId() );
				agentRequest.SetProfile( bicycleProfile->GetId() );
				agentRequest.SetPosition( startPoint );
				agentRequest.SetHeading( newBicycleVelocity.GetHeading() );

				newBicycleAgent = simulation->RequestNewAgent( agentRequest );
			}

			simulation->CreateAgents();
			simulation->ChooseAgentTargets();

			std::vector<Configuration> bicycleConfigurations;

			for ( const AgentPtr& agent: simulation->GetAllAgents() )
			{
				// Check if agent is actually a bicycle agent
				if ( agent->GetProfileId() == bicycleProfile->GetId() )
				{
					Vec3d position = agent->GetPosition();

					if ( position.GetX() > 14.0 )
					{
						agent->ExitSimulation();
					}
					else
					{
						Vec3d velocity = (agent == newBicycleAgent) ? newBicycleVelocity : agent->GetVelocity();

						agent->AssumeControl();
						agent->MoveTo( position + frameLength * velocity );

						bicycleConfigurations.push_back( Configuration( position, velocity ) );
					}
				}
			}
			
			for ( const AgentPtr& agent: simulation->GetAllAgents() )
			{
				// Check if agent is *not* a bicycle agent
				if ( agent->GetProfileId() != bicycleProfile->GetId() )
				{
					Configuration agentConfiguration( agent->GetPosition(), agent->GetVelocity() );
					Reaction reaction = agentReaction( agentConfiguration, bicycleConfigurations );
					
					if ( reaction == STOP )
					{
						agent->AssumeControl();
						agent->MoveTo( agent->GetPosition(), agent->GetVelocity(), agent->GetHeading() );
						agent->SetNextAgentMovement( AgentMovement::STANDING );
						agent->SetColor( Color::YELLOW );
					}
					else if ( reaction == EVADE )
					{
						agent->AssumeControl();
						agent->MoveTo( agent->GetPosition() + frameLength * 2 * agent->GetVelocity(), agent->GetVelocity() );
						agent->SetColor( Color::RED );
					}
					else
					{
						assert( reaction == CONTINUE );
						agent->ReleaseControl();
						agent->SetColor( Color::GREEN );
					}
				}
			}

			simulation->MoveAgents();
		}

		Sdk::Fini();
	}
	catch ( const Exception& exception )
	{
		std::cout << "ERROR: " << exception.what() << std::endl;
	}
}