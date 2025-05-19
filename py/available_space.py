from massmotion_11_0 import *

Sdk.init()
Sdk.set_output_level(LogOutputLevel.WARNING)

project = Project.open("../projects/SingleAgent.mm");
simulation = Simulation.create(project, "PythonRun", "PythonRun.mmdb");

while not simulation.is_done():
    for agent in simulation.get_all_agents():
        available_space = agent.get_available_space(3.0)
        min_radius = available_space.get_min_segment_radius()
        if min_radius < 3.0:
            min_index = available_space.get_min_segment_index()
            vector = min_radius * available_space.get_segment_direction(min_index)
            print("Vector to nearest obstacle: {}".format(vector))
        else:
            print("No nearby obstacles")
    simulation.step()

Sdk.fini()
