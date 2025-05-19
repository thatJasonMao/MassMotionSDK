/*******************************************************************************

This example shows a simple custom social forces model. If run as

	SocialForces.exe ..\..\..\Projects\SocialForces.mm SocialForces.mmdb

This will result in a new SocialForces.mmdb in the current directory; open it
in MassMotion to see the results of the simulation.

*******************************************************************************/

#include <massmotion/all.h>

#include <windows.h>

#include <iostream>
#include <unordered_map>
#include <cassert>

using namespace massmotion;

int main( int argc, char** argv )
{
	try
	{
		Sdk::Init();

		if ( argc != 3 )
		{
			std::cout << "Run as SocialForces.exe ProjectFilename.mm OutputFilename.mmdb" << std::endl;
			return 1;
		}
	
		ProjectPtr pProject = Project::Open( argv[ 1 ] );
		
		// Get the full path to the output file
		char outputPath[ 1024 ];
		GetFullPathNameA( argv[ 2 ], 1024, outputPath, NULL );

		SimulationPtr pSimulation = Simulation::Create( pProject, "SdkRun", outputPath );

		double frameLength = pSimulation->GetFrameLength();
		double maxAcceleration = 3.0;
		double maxRadius = 3.0;
		double neighborForceScale = 10.0;

		GlobalId floorId = pProject->GetFloor( "Floor" )->GetId();

		while ( !pSimulation->IsDone() )
		{
			int currentFrame = pSimulation->GetCurrentFrame();

			std::vector<AgentPtr> createdAgents = pSimulation->CreateAgents();
			pSimulation->ChooseAgentTargets();

			for ( const AgentPtr& pAgent : createdAgents )
			{
				pAgent->AssumeControl();
				pAgent->DisallowAdjustment();
			}

			for ( const AgentPtr& pAgent : pSimulation->GetAllAgents() )
			{
				Vec3d		currentPosition		= pAgent->GetPosition();
				Vec3d		currentVelocity		= pAgent->GetVelocity();

				if ( !pAgent->IsInOpenSpace() )
				{
					// Agent must have been bumped off floor - move them back
					Vec3d closestPoint = pAgent->GetOpenPointClosestTo( currentPosition, 1.0 );
					std::cout << "Agent " << pAgent->GetId() << " is off floor in frame " << currentFrame << ", moving to " << closestPoint << std::endl;
					pAgent->MoveTo( closestPoint );
				}
				else
				{
					if ( pAgent->HasTargetWaypoint() )
					{
						// Calculate goal force
						Vec3d goalDirection = pAgent->GetDirectionToTargetWaypoint();
						Vec3d desiredVelocity = goalDirection * pAgent->GetDesiredUnconstrainedSpeed();
						Vec3d goalForce = ( desiredVelocity - currentVelocity ) / frameLength;

						// Calculate neighbor force
						double agentRadius = pAgent->GetRadius();
						Vec3d netNeighborForce = Vec3d::ZERO;
						for ( const AgentPtr& pNeighbor : pSimulation->GetAgentsNearPoint( currentPosition, maxRadius, 1.0 ) )
						{
							if ( pNeighbor->GetId() != pAgent->GetId() )
							{
								Vec3d vectorToNeighbor = pNeighbor->GetPosition() - currentPosition;
								double distanceToNeighbor = vectorToNeighbor.GetLength();
								Vec3d directionToNeighbor = vectorToNeighbor / distanceToNeighbor; 
								Vec3d neighborForce = -neighborForceScale * directionToNeighbor * std::exp( -distanceToNeighbor / agentRadius );
								netNeighborForce = netNeighborForce + neighborForce;
							}
						}

						// Cap force to be equal to maximum acceleration (assume agent 'mass' is 1)
						Vec3d acceleration = goalForce + netNeighborForce;
						double magnitude = acceleration.GetLength();
						if ( magnitude > maxAcceleration )
						{
							acceleration = ( maxAcceleration / magnitude ) * acceleration;
						}

						// Move agent
						Vec3d nextVelocity = currentVelocity + acceleration * frameLength;
						Vec3d nextPosition = currentPosition + nextVelocity * frameLength;
						if ( pAgent->IsInOpenSpace( nextPosition ) )
						{
							// Move is valid - go ahead and apply
							pAgent->MoveTo( nextPosition, nextVelocity );
						}
						else
						{
							// Agent would move into an obstacle or off a floor - aim for the closest open point instead
							pAgent->MoveTo( pAgent->GetOpenPointClosestTo( nextPosition, ( nextPosition - currentPosition ).GetLength() ) );
						}
					}
				}
			}

			// Advance the simulation by one frame
			pSimulation->MoveAgents();
		}

		Sdk::Fini();
	}
	catch ( const Exception& exception )
	{
		std::cout << "ERROR: " << exception.what() << std::endl;
	}
}