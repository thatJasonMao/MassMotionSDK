from massmotion_11_0 import *
import random

Sdk.init()

project = Project.open('../projects/SeekPortals.mm')

# Find IDs of all entrance portals
entrance_portal_ids = [project.get_portal('EntrancePortal' + str(i)).get_id() for i in range(1, 5)]

# Fidn IDs of all exit portals
exit_portal_ids = [project.get_portal('ExitPortal' + str(i)).get_id() for i in range(1, 5)]

simulation_options = SimulationOptions()
simulation_options.add_extra_goals(exit_portal_ids)
simulation = Simulation.create(project, 'PythonRun', 'PythonRun.mmdb', simulation_options)

# Create common tasks
seek_task = SeekPortalTask(exit_portal_ids)
exit_task = ExitTask()

while not simulation.is_done():
    # Spawn one agent per frame
    if simulation.get_current_frame() % 5 == 0:
        # Spawn at a randomly-selected entrance portal
        simulation.request_new_agent(random.choice(entrance_portal_ids))

    frame_summary = simulation.step()

    # Catch agents as they are created
    for agent in frame_summary.get_created_agents():
        # Create a wait task with a random duration between 1 and 5 seconds
        wait_duration = random.randint(1, 5)
        wait_task = WaitForDurationTask(wait_duration, StandStillWaitStyle())
        
        # Have the agent wait around, seek the nearest exit portal, then exit
        agent.add_task_as_active(wait_task)
        agent.add_task_as_last(seek_task)
        agent.add_task_as_last(exit_task)


Sdk.fini()
