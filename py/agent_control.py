import math

from massmotion_11_0 import *

Sdk.init()

project = Project.open('../projects/AgentControl.mm')
left_floor = project.get_object('LeftFloor')
simulation = Simulation.create(project, 'PythonRun', 'PythonRun.mmdb')
velocity = Vec3d(0, 0, -1)
displacement = velocity * simulation.get_frame_length()
heading = displacement.get_heading()

print("Running...")
while not simulation.is_done():
    frame_summary = simulation.step()

    # Grab agents as they enter LeftFloor
    for agent in frame_summary.get_agents_that_entered(left_floor.get_id()):
        agent.assume_control()
        agent.set_color(Color.GREEN)

    # Control agents on LeftFloor
    for agent in simulation.get_agents_on(left_floor.get_id()):
        agent.move_to(agent.get_position() + displacement, velocity, heading)
        agent.set_next_agent_movement(AgentMovement.STANDING)

    # Release agents as they exit LeftFloor
    for agent in frame_summary.get_agents_that_exited(left_floor.get_id()):
        agent.release_control()
        agent.clear_color()

Sdk.fini()