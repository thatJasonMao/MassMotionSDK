from massmotion_11_0 import *
import random
import math


density_low = 0.03
density_med = 0.25

distance_2_low = 0.78
distance_3_low = (0.79 + 0.81) / 2
distance_4_low = (0.87 + 0.93 + 0.80) / 3

distance_2_med = 0.54
distance_3_med = (0.55 + 0.62) / 2
distance_4_med = (0.67 + 0.66 + 0.64) / 2

density_a = 0.309
density_d = 0.719
density_f = 2.174

test_radius = 5
test_area = math.pi * test_radius * test_radius

lookahead_time = 1

max_offset = 2
max_slowdown_factor = 0.5
max_speedup_factor = 2


def get_average_distance(density):
    if density == 0:
        return float('inf')
    else:
        return math.sqrt(2 / (math.sqrt(3) * density))


def interpolate(x_low, x_high, y_low, y_high, x):
    t = max(0, min((x - x_low) / (x_high - x_low), 1))
    return y_low + t * (y_high - y_low)


def get_interpolated_distance(distance_low, distance_med, density):
    distance_by_density = get_average_distance(density)
    interpolated_distance = interpolate(density_low, density_med, distance_low, distance_med, density)
    return min(interpolated_distance, distance_by_density)


def get_desired_distance(group_size, density):
    if group_size == 2:
        return get_interpolated_distance(distance_2_low, distance_2_med, density)
    elif group_size == 3:
        return get_interpolated_distance(distance_3_low, distance_3_med, density)
    elif group_size == 4:
        return get_interpolated_distance(distance_4_low, distance_4_med, density)
    else:
        raise NotImplementedError()


def get_configuration(group_size, density):
    configuration = {0: Vec3d.ZERO}
    desired_distance = get_desired_distance(group_size, density)
    if group_size == 2:
        if density <= density_d:
            configuration[1] = Vec3d(-desired_distance, 0, 0)
        else:
            configuration[1] = Vec3d(0, 0, desired_distance)
        return configuration
    elif group_size == 3:
        if density <= density_d:
            desired_angle = interpolate(0, density_d, 0, math.pi / 3, density)
            cos_angle = math.cos(desired_angle)
            sin_angle = math.sin(desired_angle)
            configuration[-1] = desired_distance * Vec3d(cos_angle, 0, sin_angle)
            configuration[1] = desired_distance * Vec3d(-cos_angle, 0, sin_angle)
        else:
            desired_angle = interpolate(density_d, density_f, math.pi / 3, math.pi / 2, density)
            cos_angle = math.cos(desired_angle)
            sin_angle = math.sin(desired_angle)
            configuration[1] = desired_distance * Vec3d(-cos_angle, 0, sin_angle)
            phi = 3 * desired_angle - math.pi
            configuration[-1] = configuration[1] + desired_distance * Vec3d(math.cos(phi), 0, math.sin(phi))
        return configuration
    elif group_size == 4:
        if density <= density_d:
            desired_angle = interpolate(0, density_d, 0, math.pi / 2, density)
            cos_angle = math.cos(desired_angle)
            sin_angle = math.sin(desired_angle)
            configuration[-1] = desired_distance * Vec3d(cos_angle, 0, sin_angle)
            configuration[1] = Vec3d(-desired_distance, 0, 0)
            configuration[2] = configuration[1] + desired_distance * Vec3d(-cos_angle, 0, sin_angle)
        else:
            desired_angle = interpolate(density_d, density_f, 0, math.pi / 2, density)
            cos_angle = math.cos(desired_angle)
            sin_angle = math.sin(desired_angle)
            configuration[1] = desired_distance * Vec3d(-cos_angle, 0, sin_angle)
            configuration[-1] = configuration[1] + desired_distance * Vec3d(cos_angle, 0, sin_angle)
            configuration[2] = configuration[-1] + configuration[1]
        return configuration
    else:
        raise NotImplementedError()


def get_random_start_point(portal):
    goal_line = portal.get_goal_line()
    goal_start_point = goal_line.get_start_point()
    goal_end_point = goal_line.get_end_point()
    goal_line_vector = goal_end_point - goal_start_point
    position = goal_start_point + random.random() * goal_line_vector
    direction = goal_line_vector.rotated_by(math.pi / 2)
    return position, direction


def create_agent_request(start_portal, end_portal, start_point, start_direction):
    agent_request = AgentRequest(start_portal.get_id())
    agent_request.set_goal(end_portal.get_id())
    agent_request.set_position(start_point)
    agent_request.set_heading(start_direction.get_heading())
    return agent_request


if __name__ == "__main__":
    Sdk.init()

    project = Project.open("../projects/Cross.mm")

    portal_names = ["NorthPortal", "EastPortal", "SouthPortal", "WestPortal"]
    portals = [project.get_portal(name) for name in portal_names]

    simulation_options = SimulationOptions()
    simulation_options.add_extra_goals([portal.get_id() for portal in portals])
    simulation = Simulation.create(project, "SdkRun", "SimpleGroups.mmdb", simulation_options)

    agents_per_second = 1.0
    agents_to_create = 0.0
    frame_length = simulation.get_frame_length()

    # Keys are leader agents
    # Values are dictionaries where keys are follower agents, values are follower position indices
    groups = {}
    group_sizes = [1, 2, 3, 4]
    group_size_to_create = random.choice(group_sizes)

    while not simulation.is_done():
        agents_to_create += frame_length * agents_per_second

        # Create individual agents and groups
        while agents_to_create >= group_size_to_create:
            start_portal, end_portal = random.sample(portals, 2)
            start_point, start_direction = get_random_start_point(start_portal)
            start_heading = start_direction.get_heading()
            group_color = Color(random.random(), random.random(), random.random())

            initial_request = create_agent_request(start_portal, end_portal, start_point, start_direction)
            if group_size_to_create > 1:
                initial_request.set_color(group_color)
            leader = simulation.request_new_agent(initial_request)

            if group_size_to_create > 1:
                groups[leader] = {}
                group_configuration = get_configuration(group_size_to_create, 0)

                def create_follower(index):
                    position = start_point + group_configuration[index].rotated_by(start_heading)
                    request = create_agent_request(start_portal, end_portal, position, start_direction)
                    request.set_color(group_color)
                    agent = simulation.request_new_agent(request)
                    groups[leader][agent] = index

                if group_size_to_create == 2:
                    create_follower(1)
                elif group_size_to_create == 3:
                    create_follower(-1)
                    create_follower(1)
                elif group_size_to_create == 4:
                    create_follower(-1)
                    create_follower(1)
                    create_follower(2)
                else:
                    raise NotImplementedError()
            
            agents_to_create -= group_size_to_create
            group_size_to_create = random.choice(group_sizes)

        frame_summary = simulation.step()

        # Remove groups as the leader exits the simulation
        for agent in frame_summary.get_deleted_agents():
            if agent in groups:
                group = groups.pop(agent)
                for follower in group:
                    if follower.exists():
                        follower.clear_goal_direction_override()

        # Update groups
        for leader in groups:
            leader_position = leader.get_position()
            leader_heading = leader.get_heading()
            leader_velocity = leader.get_velocity()
            leader_direction = leader_velocity.get_normalized()
            group = groups[leader]
            
            nearby_agents = simulation.get_agents_near_point(leader.get_position(), test_radius, 1)
            neighbor_count = 0
            for nearby_agent in nearby_agents:
                if nearby_agent not in group:
                    neighbor_count += 1
            leader_density = neighbor_count / test_area
            # leader_density = leader.get_level_of_service().get_density()

            configuration = get_configuration(1 + len(group), leader_density)
            for follower in group:
                if follower.exists():
                    if follower.get_current_floor_id() == leader.get_current_floor_id():
                        index = group[follower]
                        target_position = leader_position + configuration[index].rotated_by(leader_heading) + leader_velocity * lookahead_time
                        displacement_to_target = target_position - follower.get_position()
                        distance_to_target = displacement_to_target.get_length()
                        goal_direction = displacement_to_target.get_normalized()
                        follower.set_goal_direction_override(goal_direction)
                        follower.set_desired_unconstrained_speed(distance_to_target / lookahead_time)
                    else:
                        follower.clear_goal_direction_override()


    Sdk.fini()
