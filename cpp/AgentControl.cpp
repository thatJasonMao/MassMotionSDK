/*******************************************************************************

This example illustrates manually controlling agents. Agents entering
LeftFloor will have their color set to Color::AZURE and be manually moved
along the floor with constant speed until they exit the floor. If built in the
default location, run from a command prompt as

	AgentControl.exe ..\..\..\Projects\AgentControl.mm AgentControl.mmdb

This will result in a new AgentControl.mmdb in the current directory; open it
in MassMotion to see the results of the simulation.

*******************************************************************************/

#include <massmotion/all.h>

#include <windows.h>

#include <iostream>

using namespace massmotion;

int main( int argc, char** argv )
{
	try
	{
		Sdk::Init();

		if ( argc != 3 )
		{
			std::cout << "Run as AgentControl.exe ProjectFilename.mm OutputFilename.mmdb" << std::endl;
			return 1;
		}

		ProjectPtr pProject = Project::Open( argv[ 1 ] );

		// Get the full path to the output file
		char zOutputPath[ 1024 ];
		GetFullPathNameA( argv[ 2 ], 1024, zOutputPath, NULL );

		// Look up LeftFloor from the project
		FloorPtr pLeftFloor = pProject->GetFloor( "LeftFloor" );

		SimulationPtr pSimulation = Simulation::Create( pProject, "SdkRun", zOutputPath );

		// Set up the constant velocity/heading of manually controlled agents
		Vec3d vVelocity = Vec3d( 0, 0, -1 );
		Vec3d vDisplacement = vVelocity * pSimulation->GetFrameLength();
		double dHeading = vDisplacement.GetHeading();

		std::cout << "Running..." << std::endl;

		while ( !pSimulation->IsDone() )
		{
			// Periodically print the current frame number for progress reporting
			int iCurrentFrame = pSimulation->GetCurrentFrame();
			if ( iCurrentFrame % 100 == 0 )
			{
				std::cout << "Frame " << iCurrentFrame << std::endl;
			}

			pSimulation->CreateAgents();
			pSimulation->ChooseAgentTargets();

			// Manually move all agents on LeftFloor
			for ( const AgentPtr& pAgent : pSimulation->GetAgentsOn( pLeftFloor->GetId() ) )
			{
				pAgent->MoveTo( pAgent->GetPosition() + vDisplacement, vVelocity, dHeading );

				// Causes the agent to appear to stand in place during playback (no
				// moving arms and legs)
				pAgent->SetNextAgentMovement( AgentMovement::STANDING );
			}

			FrameSummary frameSummary = pSimulation->MoveAgents();

			// Assume control of all agents entering LeftFloor and set their color
			// to Color::AZURE
			for ( const AgentPtr& pAgent : frameSummary.GetAgentsThatEntered( pLeftFloor->GetId() ) )
			{
				pAgent->AssumeControl();
				pAgent->SetColor( Color::AZURE );
			}

			// Release control and reset color of agents exiting LeftFloor
			for ( const AgentPtr& pAgent : frameSummary.GetAgentsThatExited( pLeftFloor->GetId() ) )
			{
				pAgent->ReleaseControl();
				pAgent->ClearColor();
			}
		}

		Sdk::Fini();
	}
	catch ( const Exception& exception )
	{
		std::cout << "ERROR: " << exception.what() << std::endl;
	}
}