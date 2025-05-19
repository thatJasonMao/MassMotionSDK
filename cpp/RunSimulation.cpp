/*******************************************************************************

This example illustrates opening a pre-existing MassMotion project and running
a simulation. If built in the default location, run from a command prompt as

	RunSimulation.exe ..\..\..\Projects\SimpleJourney.mm SimpleJourney.mmdb

This will result in a new SimpleJourney.mmdb in the current directory; open it
in MassMotion to see the results of the run.

*******************************************************************************/

// all.h is a convenience header that includes all other MassMotion headers;
// this is convenient, but can increase build times since unnecessary headers
// may be included
#include <massmotion/all.h>

#include <windows.h>

#include <iostream>
#include <algorithm>

// All MassMotion classes are within the massmotion:: namespace
using namespace massmotion;

int main( int argc, char** argv )
{
	// Wrap everything in a try/catch block so that if an Exception is thrown
	// we can see the error message
	try
	{
		// Necessary before calling any other SDK functions
		Sdk::Init();

		// Check that two arguments have been given
		if ( argc != 3 )
		{
			std::cout << "Run as RunSimulation.exe InputFilename.mm OutputFilename.mmdb" << std::endl;
			return 1;
		}

		// Open a project from the given input .mm file
		ProjectPtr pProject = Project::Open( argv[ 1 ] );
		
		// Get the full path to the output file
		char zOutputPath[ 1024 ];
		GetFullPathNameA( argv[ 2 ], 1024, zOutputPath, NULL );

		// Create a new simulation from the project and have it write to the given
		// .mmdb file
		SimulationPtr pSimulation = Simulation::Create( pProject, "SdkRun", zOutputPath );

		// Run the simulation
		while ( !pSimulation->IsDone() )
		{
			// Periodically write the current simulation time and population for
			// progress reporting
			if ( pSimulation->GetCurrentFrame() % 10 == 0 )
			{
				std::string		zSimulationTime		= pSimulation->GetClock()->GetCurrentTimeString();
				int				iPopulation			= int( pSimulation->GetAllAgents().size() );

				std::cout << zSimulationTime << ": " << iPopulation << " agents" << std::endl;
			}

			// Advance the simulation by one frame
			pSimulation->Step();
		}

		// Should be called after you are finished using the SDK
		Sdk::Fini();
	}
	catch ( const Exception& exception )
	{
		// Print out the error message for debugging
		std::cout << "ERROR: " << exception.what() << std::endl;
	}
}
