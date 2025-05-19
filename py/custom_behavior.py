import random

from massmotion_11_0 import *

# Default MassMotion simulation frame rate
fps = 5

Sdk.init()

project = Project.open('../projects/SdkSkeleton.mm')

default_profile = project.get_profile("DefaultProfile")

start_portal_1 = project.get_portal("StartPortal1")
start_portal_2 = project.get_portal("StartPortal2")
start_portal_3 = project.get_portal("StartPortal3")

end_portal_1 = project.get_portal("EndPortal1")
end_portal_2 = project.get_portal("EndPortal2")
end_portal_3 = project.get_portal("EndPortal3")

start_floor_1 = project.get_floor("StartFloor1")
start_floor_2 = project.get_floor("StartFloor2")
start_floor_3 = project.get_floor("StartFloor3")

end_floor_1 = project.get_floor("EndFloor1")
end_floor_2 = project.get_floor("EndFloor2")
end_floor_3 = project.get_floor("EndFloor3")

link_1 = project.get_link("Link1")
link_2 = project.get_link("Link2")
link_3 = project.get_link("Link3")

wait_task = WaitForeverTask(SpreadOutWaitStyle())

simulation_options = SimulationOptions()
end_portal_ids = [portal.get_id() for portal in [end_portal_1, end_portal_2, end_portal_3]]
simulation_options.add_extra_goals(end_portal_ids)

simulation = Simulation.create(project, 'PythonRun', 'PythonRun.mmdb', simulation_options)
random.seed(1234)

very_first_agent = None

print("Running...")
while not simulation.is_done():
    current_frame = simulation.get_current_frame()
    all_agents = simulation.get_all_agents()
    
    # Request one agent per second at each portal on average
    if random.random() < 1.0 / fps:
        request_1 = AgentRequest(start_portal_1.get_id())
        request_1.set_color(Color.RED)
        request_1.set_goal(end_portal_1.get_id());
        if very_first_agent is None:
            very_first_agent = simulation.request_new_agent(request_1)
        else:
            simulation.request_new_agent(request_1)

        request_2 = AgentRequest(start_floor_2.get_id())
        request_2.set_color(Color.GREEN)
        request_2.set_goal(end_portal_2.get_id());
        simulation.request_new_agent(request_2)

        request_3 = AgentRequest(start_portal_3.get_id())
        request_3.set_color(Color.TURQUOISE)
        request_3.set_goal(end_portal_3.get_id());
        simulation.request_new_agent(request_3)

    # Close first link for 2 seconds every 10 seconds
    if current_frame % (10 * fps) > (8 * fps):
        simulation.close_gate(link_1.get_id())
    else:
        simulation.reset_gate(link_1.get_id())

    # Remove all agents entering EndFloor2
    for agent in all_agents:
        if agent.get_current_floor_id() == end_floor_2.get_id():
            agent.exit_simulation()

    # Have agents in EndFloor3 just wait around until they are removed
    for agent in all_agents:
        if agent.get_current_floor_id() == end_floor_3.get_id():
            agent.clear_tasks()
            agent.add_task_as_active(wait_task)

    floor_3_population = simulation.get_population(start_floor_3.get_id())
    if floor_3_population > 30:
        # When population on StartFloor3 reaches a threshold, open the gate
        # and remove all agents on EndFloor3
        simulation.open_gate(link_3.get_id())
        for agent in all_agents:
            if agent.get_current_floor_id() == end_floor_3.get_id():
                agent.exit_simulation()
    elif floor_3_population < 10:
        # When population on StartFloor3 drops below a threshold, close the
        # gate again
        simulation.close_gate(link_3.get_id())

    simulation.step()

    if very_first_agent is not None and very_first_agent.exists():
        if very_first_agent.has_target_waypoint():
            print("Current waypoint: {}".format(project.get_object(very_first_agent.get_target_waypoint_id()).get_name()))
            print("  Distance to waypoint: {}".format(very_first_agent.get_distance_to_target_waypoint()))
            print("  Direction to waypoint: {}".format(very_first_agent.get_direction_to_target_waypoint()))
        else:
            print("No current goal")

Sdk.fini()
