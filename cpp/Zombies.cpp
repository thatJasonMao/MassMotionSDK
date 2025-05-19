#include <massmotion/all.h>
#include <vector>
#include <math.h>
#include <time.h>
#include <algorithm>

using namespace massmotion;

double FearSpeedTransform( double dFear );

double generateRandDouble( double lowerLimit, double upperLimit )
{
	double dRetVal = ( upperLimit - lowerLimit ) * ( ( double ) rand() / ( double ) RAND_MAX ) + lowerLimit;
	return dRetVal;
}

struct Human
{
	AgentPtr mpSelf;
	double Speed;
	double ClosestDistance;
	std::vector<GlobalId > PreviousLocations;
	GlobalId OriginalGoal;
	GlobalId mOriginPortal;

	Human() :
		mpSelf( NULL ),
		Speed( 0.0 ),
		ClosestDistance( 0.0 ),
		PreviousLocations( std::vector<GlobalId >{} ),
		OriginalGoal( GlobalId() ),
		mOriginPortal( GlobalId() )
	{
	}

	Human( AgentPtr mSelf, double dOriginalSpeed, GlobalId goal, GlobalId OriginPortal ) :
		mpSelf( mSelf ),
		Speed( dOriginalSpeed ),
		ClosestDistance( generateRandDouble( 7, 14 ) ),
		PreviousLocations( std::vector<GlobalId >{} ),
		OriginalGoal( goal ),
		mOriginPortal( OriginPortal )
	{
	}

	Human( const Human& other ) :
		mpSelf( other.mpSelf ),
		Speed( other.Speed ),
		ClosestDistance( other.ClosestDistance ),
		PreviousLocations( other.PreviousLocations ),
		OriginalGoal( other.OriginalGoal ),
		mOriginPortal( other.mOriginPortal )
	{
	}
};
typedef std::shared_ptr< Human > HumanPtr;

class Zombie
{
private:
	AgentPtr mpSelf;
	AgentPtr mpTarget;
	int mAge;
	double mdFrameLen;
	GlobalId PreviousTargetFloor;
	double mdSight;

public:
	Zombie() :
		mpSelf( NULL ),
		mpTarget( NULL ),
		mAge( 0 ),
		mdFrameLen( 0 ),
		PreviousTargetFloor( GlobalId() ),
		mdSight( 0 )
	{
	}

	Zombie( AgentPtr pAgent, double dFrameLen ) :
		mpSelf( pAgent ),
		mpTarget( NULL ),
		mAge( 0 ),
		mdFrameLen( dFrameLen ),
		PreviousTargetFloor( GlobalId() ),
		mdSight( generateRandDouble( 75, 150 ) )
	{
	}

	Zombie( const Zombie& pOther ) :
		mpSelf( pOther.mpSelf ),
		mpTarget( pOther.mpTarget ),
		mAge( pOther.mAge ),
		mdFrameLen( pOther.mdFrameLen ),
		PreviousTargetFloor( pOther.PreviousTargetFloor ),
		mdSight( pOther.mdSight )
	{
	}

	// called every frame
	bool Act()
	{
		// target checking
		if( HasTarget() )
		{
			if( !mpTarget->Exists() )
			{
				mpTarget = NULL;
			}
		}

		// die if old enough
		mAge++;
		if( mAge > 1000 )
		{
			return true;
		}

		// just dance around if no humans in nearby proximity
		if( !HasTarget() )
		{
			MillAbout();
		}
		// move towards their target
		else
		{
			MoveToTarget();
		}

		return false;
	}

	AgentPtr GetSelf()
	{
		return mpSelf;
	}

	// find the nearest target from a vector of agents
	// returns true if there is a closer target
	void FindTarget( std::vector<HumanPtr>& vpAgents )
	{
		AgentPtr pTarget = NULL;
		Vec3d closestHumanPos;
		Vec3d zombiePos = mpSelf->GetPosition();
		if( vpAgents.size() > 0 )
		{
			closestHumanPos = Vec3d( 1000, 1000, 1000 );
			for( const HumanPtr& pHuman : vpAgents )
			{
				if( pHuman->mpSelf->Exists() )
				{
					Vec3d HumanLocation = pHuman->mpSelf->GetPosition();
					Vec3d tempDistance = HumanLocation - zombiePos;
					if( abs( tempDistance.GetLength() ) < abs( closestHumanPos.GetLength() ) )
					{
						closestHumanPos = tempDistance;
						// arbitrary distance of zombies 'sight'
						if( closestHumanPos.GetLength() < mdSight )
						{
							pTarget = pHuman->mpSelf;
						}
					}
				}
			}
		}

		// target is the same as before
		mpTarget = pTarget;
	}

	bool HasTarget()
	{
		if( mpTarget == NULL )
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	// no target, so just random movement
	void MillAbout()
	{
		mpSelf->AssumeControl();
		Vec3d vToMove = ( Vec3d( std::rand() % 20 / 10.0 - 1.0, 0, std::rand() % 20 / 10.0 - 1.0 ) ).GetNormalized() / 4.0;
		mpSelf->MoveTo( mpSelf->GetPosition() + vToMove, vToMove );
	}

	void MoveToTarget()
	{
		GlobalId selfFloorGlobalId = mpSelf->GetCurrentFloorId();
		GlobalId targetFloorGlobalId = mpTarget->GetCurrentFloorId();
		// the zombie is on a different floor
		// head to that floor
		if( selfFloorGlobalId != targetFloorGlobalId )
		{
			mpSelf->ReleaseControl();

			// already seeking this floor
			if( targetFloorGlobalId == PreviousTargetFloor )
			{

			}
			// should seek a different floor
			else
			{
				mpSelf->ClearTasks();
				TaskPtr pTask( new SeekAreaTask( targetFloorGlobalId, true ) );
				mpSelf->AddTaskAsActive( pTask );
				PreviousTargetFloor = targetFloorGlobalId;
			}
		}
		// the zombie is on the same floor
		else
		{
			if( mpTarget->Exists() )
			{
				mpSelf->AssumeControl();
				Vec3d SelfToTarget = mpTarget->GetPosition() - mpSelf->GetPosition();
				Vec3d SelfToTargetNorm = ( SelfToTarget ).GetNormalized();

				mpSelf->MoveTo( mpSelf->GetPosition() + mdFrameLen * SelfToTargetNorm );
			}
		}
	}

};
typedef std::shared_ptr< Zombie > ZombiePtr;

enum BodyType
{
	INFECTED,
	DEAD_ZOMBIE
};

struct Body
{
	AgentPtr mpSelf;
	int miAge;
	int miMaxAge;
	BodyType mBodyType;

	Body( AgentPtr pSelf, int iMaxAge, BodyType iBodyType ) :
		mpSelf( pSelf ),
		miAge( 0 ),
		miMaxAge( iMaxAge ),
		mBodyType( iBodyType )
	{
	}

	Body( const Body& pOther ) :
		mpSelf( pOther.mpSelf ),
		miAge( pOther.miAge ),
		miMaxAge( pOther.miMaxAge ),
		mBodyType( pOther.mBodyType )
	{
	}

	// if the body has been there long enough, return true to ressurect as zombie
	bool Return()
	{
		miAge++;
		if( miAge > miMaxAge )
		{
			return true;
		}
		else
		{
			return false;
		}
	}

};
typedef std::shared_ptr<Body> BodyPtr;

double FearSpeedTransform( double dDistance )
{
	if( dDistance == -0.8 )
	{
		return -1;
	}
	return ( 0.3 / ( dDistance + 0.8 ) );
}

AgentRequest SpawnAgent( GlobalId floorId, Vec3d entryPos, ProfilePtr pProfile )
{
	AgentRequest newAgentRequest = AgentRequest( floorId );
	newAgentRequest.SetProfile( pProfile->GetId() );
	newAgentRequest.SetHeading( rand() % 361 );
	newAgentRequest.SetPosition( entryPos );

	return newAgentRequest;
}

int main( int argc, char** argv )
{
	try
	{
		//////////////////////////////////////////////////////////////////////////////////////////
		// Editable variables for the simulation.												//
		// Feel free to change them, though this could adversely affect simulation performance.	//
		//////////////////////////////////////////////////////////////////////////////////////////

		// length of the simulation
		int iSimulationLengthInSeconds = 60 * 10;

		// set variable amounts of people / zombies
		int iNumHumansToCreate = 500;
		int iNumZombiesToCreate = 5;

		// Spawning cycle time lengths
		// ex: a spawning cycle length of 3 means that humans will get spawned every 3 seconds
		int iHumanSpawningCycleLengthInSeconds = 3;
		int iZombieSpawningCycleLengthInSeconds = 5;

		// These numbers limit the maximum number of agents of each type that can be created per cycle
		// Every cycle, a random number between 0 and x is picked as the number of agents to spawn, where x is the variable below.
		int iMaxNumHumansToCreatePerCycle = static_cast< int >( ceil( static_cast< double >( iNumHumansToCreate ) / 100. ) );
		int iMaxNumZombieToCreatePerCycle = static_cast< int >( ceil( static_cast< double >( iNumZombiesToCreate ) / 150. ) );

		// The number of frames that each type of body will exist for.
		// There are 5 frames/second.
		// Be aware, the longer a body is around for, the slower the simulation will be.
		int iInfectedBodyLifetime = 120;
		int iDeadZombieBodyLifetime = 50;

		// the number of frames the humans have to populate the city before the zombies start appearing
		// 5 frames/second.
		int iHumanTimeAdvantage = 5 * 1 * 60;

		Sdk::Init();
		if( argc != 3 )
		{
			throw Exception( "Error: Run as Executable.exe ProjectFilename.mm OutputFilename.mmdb" );
		}

		srand( (unsigned int)time( NULL ) );
		bool HidePortals = true;
		ProjectPtr pProject = Project::Open( argv[1] );

		if( 0
			|| !pProject->HasObject( "zombieAvatar" )
			|| !pProject->HasObject( "deadZombieAvatar" )
			|| !pProject->HasObject( "deadHumanAvatar" ) )
		{
			throw Exception( "Error: Missing avatars. Include an avatar for zombies (called 'zombieAvatar'), an avatar for dead zombies (called 'deadZombieAvatar'), and an avatar for dead humans (called 'deadHumanAvatar')" );
		}

		GlobalId zombieAvatar = pProject->GetObject( "zombieAvatar" )->GetId();
		ProfilePtr pZombieProfile = pProject->CreateProfile( "zombieProfile" );
		pZombieProfile->SetAvatar( zombieAvatar );

		GlobalId deadHumanAvatar = pProject->GetObject( "deadHumanAvatar" )->GetId();
		ProfilePtr pDeadBodyProfile = pProject->CreateProfile( "deadHumanProfile" );
		pDeadBodyProfile->SetAvatar( deadHumanAvatar );

		GlobalId deadZombieAvatar = pProject->GetObject( "deadZombieAvatar" )->GetId();
		ProfilePtr pDeadZombieProfile = pProject->CreateProfile( "deadZombieProfile" );
		pDeadZombieProfile->SetAvatar( deadZombieAvatar );

		pProject->SetDurationInSeconds( iSimulationLengthInSeconds );
		SimulationOptions simulationOptions;
		std::vector< GlobalId > ExtraGoals;

		std::vector< PortalPtr > portals = pProject->GetPortals();

		// get the portals and hide them
		for( int i = 0; i < portals.size(); i++ )
		{
			PortalPtr pPortal = portals.at( i );
			if( HidePortals )
			{
				pPortal->Hide();
			}
			ExtraGoals.push_back( pPortal->GetId() );
		}

		std::vector<WalkableObjectPtr> pWalkableObjects = pProject->GetWalkableObjects();
		for( int i = 0; i < pWalkableObjects.size(); i++ )
		{
			WalkableObjectPtr pWalkableObj = pWalkableObjects.at( i );
			ExtraGoals.push_back( pWalkableObj->GetId() );
		}

		// set extra goals so that agents can seek anything
		simulationOptions.AddExtraGoals( ExtraGoals );

		SimulationPtr pSimulation = Simulation::Create( pProject, "ZombieApocalypse", std::string( argv[2] ), simulationOptions );

		double dFrameLength = pSimulation->GetFrameLength();

		if( 0
			|| !pProject->HasObject( "humanPortals" )
			|| !pProject->HasObject( "zombiePortals" ) )
		{
			throw Exception( "Error: Missing collections. Include a collection of portals called humanPortals for humans to appear from and one called zombiePortals for zombies." );
		}

		CollectionPtr pHumanPortalCollection = pProject->GetCollection( "humanPortals" );
		std::vector< GlobalId > vHumanPortalIds = pHumanPortalCollection->GetBaseMemberIds();
		CollectionPtr pZombiePortalCollection = pProject->GetCollection( "zombiePortals" );
		std::vector< GlobalId > vZombiePortalIds = pZombiePortalCollection->GetBaseMemberIds();

		if( vHumanPortalIds.size() < 2 || vZombiePortalIds.size() < 1 )
		{
			throw Exception( "Error: There must be at least two human portals and at least one zombie portal." );
		}

		std::vector< HumanPtr > humans;
		std::vector< ZombiePtr > zombies;
		std::vector< BodyPtr > bodies;

		while( !pSimulation->IsDone() )
		{
			for( HumanPtr& pAgent : humans )
			{
				// how quickly should the agent run based on the proximity and quantity of nearby zombies
				double dFearFactor = 1;
				if( pAgent->mpSelf->Exists() )
				{
					// backtracking logic for the agents
					GlobalId CurrentFloor = pAgent->mpSelf->GetCurrentFloorId();
					if( pAgent->PreviousLocations.size() > 0 )
					{
						if( pAgent->PreviousLocations.back() == CurrentFloor)
						{
							// agent is on the same floor
						}
						else if( std::find( pAgent->PreviousLocations.begin(), pAgent->PreviousLocations.end(), CurrentFloor ) != pAgent->PreviousLocations.end() )
						{
							// agent has already been here
							pAgent->PreviousLocations.pop_back();
						}
						else
						{
							// agent is on a new area
							pAgent->PreviousLocations.push_back( CurrentFloor );
						}
					}
					else
					{
						// agent has not been anywhere before
						pAgent->PreviousLocations.push_back( CurrentFloor );
					}

					// local zombie checking
					ZombiePtr pClosestZombie;
					Vec3d closestZombiePos;
					Vec3d selfPos = pAgent->mpSelf->GetPosition();
					closestZombiePos = Vec3d( 1000, 1000, 1000 );
					for( const ZombiePtr& pZombie : zombies )
					{
						if( pZombie->GetSelf()->Exists() )
						{
							Vec3d ZombieLocation = pZombie->GetSelf()->GetPosition();
							Vec3d tempDistance = ZombieLocation - selfPos;
							if( abs( tempDistance.GetLength() ) < abs( closestZombiePos.GetLength() ) )
							{
								closestZombiePos = tempDistance;
								pClosestZombie = pZombie;
							}

							dFearFactor += FearSpeedTransform( tempDistance.GetLength() );
						}
					}

					// if a zombie is too close, get infected
					if( closestZombiePos.GetLength() < 1 )
					{
						// create a new dead body
						AgentRequest newAgentRequest = SpawnAgent( pAgent->mpSelf->GetCurrentFloorId(), pAgent->mpSelf->GetPosition(), pDeadBodyProfile );
						AgentPtr pDeadBody = pSimulation->RequestNewAgent( newAgentRequest );
						pDeadBody->SetRadius( 0 );
						bodies.push_back( BodyPtr( new Body( pDeadBody, iInfectedBodyLifetime, BodyType::INFECTED ) ) );

						// agent dies
						pAgent->mpSelf->ExitSimulation();
					}
					// zombie is too close to the human
					// each human has a different closest distance they feel comfortable being to zombies
					else if( closestZombiePos.GetLength() < pAgent->ClosestDistance )
					{
						pAgent->mpSelf->ClearTasks();
						// if there's at least 2 places they've already been
						if( pAgent->PreviousLocations.size() >= 2 )
						{
							GlobalId destination = pAgent->PreviousLocations.end()[-2];

							// try to reach their previous area, then try and reach their exit again
							TaskPtr pTask( new SeekAreaTask( destination, true ) );
							pAgent->mpSelf->AddTaskAsActive( pTask );

							TaskPtr pSeekPortalTask( new SeekPortalTask( pAgent->OriginalGoal, true ) );
							pAgent->mpSelf->AddTaskAsLast( pSeekPortalTask );

							TaskPtr pExitTask( new ExitTask() );
							pAgent->mpSelf->AddTaskAsLast( pExitTask );
						}
						// the agent is on their original floor, so just get out through their original entrance
						else
						{
							TaskPtr pSeekPortalTask( new SeekPortalTask( pAgent->mOriginPortal, true ) );
							pAgent->mpSelf->AddTaskAsLast( pSeekPortalTask );

							TaskPtr pExitTask( new ExitTask() );
							pAgent->mpSelf->AddTaskAsLast( pExitTask );
						}
					}

					// set an agent's speed based on their current fear
					pAgent->mpSelf->SetDesiredUnconstrainedSpeed( pAgent->Speed * dFearFactor );
				}
			}

			 //spawn humans
			if( ( ( pSimulation->GetClock()->GetCurrentSecondAsInt() % iHumanSpawningCycleLengthInSeconds ) == 0 ) && ( iNumHumansToCreate > 0 ) )
			{
				for( int i = 0; i < ( rand() % iMaxNumHumansToCreatePerCycle ) + 1; i++ )
				{
					iNumHumansToCreate--;

					std::vector<GlobalId> vTempGlobalIds = vHumanPortalIds;

					//pick a random index for agent entry portal
					int randIdx = rand() % vTempGlobalIds.size();
					GlobalId entryPortalId = vTempGlobalIds[randIdx];

					//remove the entry portal from the vector so the agent won't exit from the same portal they enetered from
					vTempGlobalIds.erase( vTempGlobalIds.begin() + randIdx );
					randIdx = rand() % vTempGlobalIds.size();
					GlobalId exitPortalId = vTempGlobalIds[randIdx];
					AgentRequest newAgentRequest = AgentRequest( entryPortalId );
					newAgentRequest.SetColor( Color::RED );
					newAgentRequest.SetGoal( exitPortalId );
					AgentPtr pAgent = pSimulation->RequestNewAgent( newAgentRequest );

					humans.push_back( HumanPtr( new Human( pAgent, pAgent->GetDesiredUnconstrainedSpeed(), exitPortalId, entryPortalId ) ) );
				}
			}

			// spawn zombies
			if	( 1
				&& ( pSimulation->GetClock()->GetCurrentSecondAsInt() % iZombieSpawningCycleLengthInSeconds )
				&& ( iNumZombiesToCreate > 0 )
				&& ( pSimulation->GetCurrentFrame() > iHumanTimeAdvantage )
				)
			{
				for( int i = 0; i < ( rand() % iMaxNumZombieToCreatePerCycle ) + 1; i++ )
				{
					//std::cout << "create zombie" << std::endl;
					iNumZombiesToCreate--;

					//pick a random index for agent entry portal
					int randIdx = rand() % vZombiePortalIds.size();
					GlobalId entryPortalId = vZombiePortalIds[randIdx];

					//remove the entry portal from the vector so the agent won't exit from the same portal they enetered from
					AgentRequest newAgentRequest = AgentRequest( entryPortalId );

					// set profile for the zombie avatar to appear
					newAgentRequest.SetProfile( pZombieProfile->GetId() );
					AgentPtr pNewAgent = pSimulation->RequestNewAgent( newAgentRequest );
					zombies.push_back( ZombiePtr( new Zombie( pNewAgent, dFrameLength ) ) );
				}
			}

			// dead body calculations
			for( int i = 0; i < bodies.size(); i++ )
			{
				BodyPtr& pBody = bodies.at( i );
				if( pBody->mpSelf->Exists() )
				{
					// Return increments age and then check if the body has existed long enough to return or disappear
					if( pBody->Return() )
					{
						// return as a zombie if infected
						if( pBody->mBodyType == INFECTED )
						{
							AgentRequest newAgentRequest = SpawnAgent( pBody->mpSelf->GetCurrentFloorId(), pBody->mpSelf->GetPosition(), pZombieProfile );
							AgentPtr pNewAgent = pSimulation->RequestNewAgent( newAgentRequest );
							zombies.push_back( ZombiePtr( new Zombie( pNewAgent, dFrameLength ) ) );
						}

						pBody->mpSelf->ExitSimulation();
						bodies.erase( bodies.begin() + i );
					}
				}
			}

			// actually create all those agents
			pSimulation->CreateAgents();

			for( int i = 0; i < zombies.size(); i++ )
			{
				ZombiePtr pZombie = zombies.at( i );
				if( pZombie->GetSelf()->Exists() )
				{
					// find closest target
					pZombie->FindTarget( humans );

					// act() returns true if old enough to die
					if( pZombie->Act() )
					{
						AgentRequest newAgentRequest = SpawnAgent( pZombie->GetSelf()->GetCurrentFloorId(), pZombie->GetSelf()->GetPosition(), pDeadZombieProfile );
						AgentPtr pDeadBody = pSimulation->RequestNewAgent( newAgentRequest );
						pDeadBody->SetRadius( 0 );
						bodies.push_back( BodyPtr( new Body( pDeadBody, iDeadZombieBodyLifetime, BodyType::DEAD_ZOMBIE ) ) );
						pZombie->GetSelf()->ExitSimulation();
						zombies.erase( zombies.begin() + i );
					}
				}
				else
				{
					zombies.erase( zombies.begin() + i );
				}
			}

			pSimulation->ChooseAgentTargets();
			pSimulation->MoveAgents();
		}
		Sdk::Fini();
	}
	catch (const Exception& exception)
	{
		std::cout << exception.GetMessage() << std::endl;
	}
}