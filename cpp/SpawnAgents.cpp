/*******************************************************************************

This example illustrates manually spawning and controlling agents. Agents are
manually moved forward from the time they enter the simulation until they pass
a 'goal line' at Z=0, at which point they are released to seek an end portal.
If built in the default location, run from a command prompt as

	SpawnAgents.exe ..\..\..\Projects\SpawnAgents.mm SpawnAgents.mmdb

This will result in a new SpawnAgents.mmdb in the current directory; open it
in MassMotion to see the results of the simulation.

*******************************************************************************/

#include <massmotion/all.h>

#include <windows.h>

#include <iostream>
#include <unordered_set>

using namespace massmotion;

int main( int argc, char** argv )
{
	try
	{
		Sdk::Init();

		if ( argc != 3 )
		{
			std::cout << "Run as SpawnAgents.exe InputFilename.mm OutputFilename.mmdb" << std::endl;
			return 1;
		}

		ProjectPtr pProject = Project::Open( argv[ 1 ] );

		PortalPtr pStartPortal = pProject->GetPortal( "StartPortal" );
		PortalPtr pEndPortal = pProject->GetPortal( "EndPortal" );

		// Get the full path to the output file
		char zOutputPath[ 1024 ];
		GetFullPathNameA( argv[ 2 ], 1024, zOutputPath, NULL );

		SimulationOptions simulationOptions;
		simulationOptions.AddExtraGoal( pEndPortal->GetId() );
		SimulationPtr pSimulation = Simulation::Create( pProject, "SdkRun", zOutputPath, simulationOptions );
		double dFrameLength = pSimulation->GetFrameLength();
		double dTimeSinceSpawn = 0.0;
		Vec3d vVelocity = Vec3d( 0, 0, 1 );

		// List of agents that are under manual control
		std::vector<AgentPtr> apControlledAgents;

		while ( !pSimulation->IsDone() )
		{
			AgentPtr pNewAgent;

			// Periodically print out frame numbers for progress reporting
			int iCurrentFrame = pSimulation->GetCurrentFrame();
			if ( iCurrentFrame % 100 == 0 )
			{
				std::cout << "Frame " << iCurrentFrame << std::endl;
			}

			// Request one new agent per second
			if ( dTimeSinceSpawn >= 1.0 )
			{
				pNewAgent = pSimulation->RequestNewAgent( pStartPortal->GetId() );
				dTimeSinceSpawn -= 1.0;
			}

			pSimulation->CreateAgents();

			if ( pNewAgent != NULL && pNewAgent->Exists() )
			{
				pNewAgent->AssumeControl();
				apControlledAgents.push_back( pNewAgent );
			}

			pSimulation->ChooseAgentTargets();

			// Start a temporary list to hold all agents who did not 'cross the
			// finish line' in the current frame (and should therefore continue
			// to be controlled in the next frame)
			std::vector<AgentPtr> apUnfinishedAgents;

			// Update all controlled agents
			for ( const AgentPtr& pAgent : apControlledAgents )
			{
				pAgent->MoveTo( pAgent->GetPosition() + vVelocity * dFrameLength );
			}

			pSimulation->MoveAgents();

			// Update all controlled agents
			for ( const AgentPtr& pAgent : apControlledAgents )
			{
				if ( pAgent->Exists() )
				{
					// Check if agent has moved forward past the 'finish line'
					if ( pAgent->GetPosition().GetZ() >= 0.0 )
					{
						// Release control of the agent, set their color for
						// debugging purposes, and finally have them seek the exit
						// portal and then exit the simulation
						pAgent->ReleaseControl();
						pAgent->SetColor( Color::CHARTREUSE );
						pAgent->AddTaskAsActive( TaskPtr( new SeekPortalTask( pEndPortal->GetId() ) ) );
						pAgent->AddTaskAsLast( TaskPtr( new ExitTask() ) );
					}
					else
					{
						// Add agent to the list of agents to control in the next frame
						apUnfinishedAgents.push_back( pAgent );
					}
				}
			}

			// Update the list of agents to control in the next frame to be all
			// those agents who did not 'finish' in the current frame
			apControlledAgents = std::move( apUnfinishedAgents );

			// Keep track of elapsed time for purposes of spawning agents
			dTimeSinceSpawn += dFrameLength;
		}

		Sdk::Fini();
	}
	catch ( const Exception& exception )
	{
		std::cout << "ERROR: " << exception.what() << std::endl;
	}
}
