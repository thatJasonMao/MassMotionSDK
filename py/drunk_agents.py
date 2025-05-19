import math
import random

from massmotion_11_0 import *

def create_random_agent(simulation, portal_ids):
    agent_request = AgentRequest(random.choice(portal_ids))
    return simulation.request_new_agent(agent_request)

Sdk.init()

project = Project.open('../projects/ObstacleCourse.mm')

portal_ids = [project.get_portal("Portal" + str(index)).get_id() for index in range(1, 9)]

simulation_options = SimulationOptions()
simulation_options.add_extra_goals(portal_ids)
simulation = Simulation.create(project, 'PythonRun', 'PythonRun.mmdb', simulation_options)
frame_length = simulation.get_frame_length()

agent_speeds = {}
agent_max_turn_rates = {}
agent_cycle_periods = {}
agent_last_positions = {}

for i in range(10):
    random.shuffle(portal_ids)
    agent_request = AgentRequest(portal_ids[0])
    agent_request.set_goal(portal_ids[1])

    agent = simulation.request_new_agent(agent_request)

    agent_speeds[agent] = random.uniform(0.75, 1.25)
    agent_max_turn_rates[agent] = random.uniform(math.pi / 6, math.pi / 4)
    agent_cycle_periods[agent] = random.uniform(2.0, 5.0)

print("Running...")
while not simulation.is_done():
    time = simulation.get_clock().get_current_second()

    for agent in simulation.get_all_agents():
        speed = agent_speeds[agent]
        max_turn_rate = agent_max_turn_rates[agent]
        cycle_period = agent_cycle_periods[agent]

        agent.assume_control()
        agent.disallow_adjustment()
        current_position = agent.get_position()
        current_heading = agent.get_heading()
        turn_rate = max_turn_rate * (0.5 + 0.5 * math.sin(2 * math.pi * time / cycle_period))
        heading = current_heading + turn_rate * frame_length
        velocity = speed * Vec3d.FORWARD_DIRECTION.rotated_by(heading)
        desired_position = current_position + velocity * frame_length
        agent.move_to(desired_position, velocity, heading)

        if agent in agent_last_positions:
            if current_position == agent_last_positions[agent]:
                agent.set_next_agent_movement(AgentMovement.STANDING)
            else:
                agent.set_next_agent_movement(AgentMovement.WALKING)

        agent_last_positions[agent] = current_position

    simulation.step()

Sdk.fini()
