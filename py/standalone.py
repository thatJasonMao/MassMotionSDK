from massmotion_11_0 import *
import random
import os.path

def rectangle(z1, z2, x1, x2, y):
    p1 = Vec3d(x1, y, z1)
    p2 = Vec3d(x1, y, z2)
    p3 = Vec3d(x2, y, z2)
    p4 = Vec3d(x2, y, z1)
    first_triangle = Tri3d(p1, p2, p3)
    second_triangle = Tri3d(p1, p3, p4)
    triangles = [first_triangle, second_triangle]
    return MeshGeometry.create(triangles)

Sdk.init()

project = Project.create()

floor_geometry = rectangle(0, 30, -5, 5, 0)
floor = project.create_floor("Floor", floor_geometry)

portal1_geometry = rectangle(1, 3, -4, 4, 0.2)
portal1 = project.create_portal("Portal1", portal1_geometry)

portal2_geometry = rectangle(27, 29, -4, 4, 0.2)
portal2 = project.create_portal("Portal2", portal2_geometry)

duration_in_minutes = 5
duration_in_seconds = duration_in_minutes * 60
project.set_duration_in_seconds(duration_in_seconds)
duration_in_frames = project.get_frame_rate() * duration_in_seconds
frame_length = project.get_frame_length()

simulation_options = SimulationOptions()
simulation_options.add_extra_goals([portal1.get_id(), portal2.get_id()])
simulation = Simulation.create(project, "SdkRun", os.path.abspath("SdkRun.mmdb"), simulation_options)
while not simulation.is_done():
    current_frame = float(simulation.get_current_frame())
    scale1 = current_frame / duration_in_frames
    scale2 = (duration_in_frames - current_frame) / duration_in_frames
    spawn1 = random.random() * scale1 < frame_length
    spawn2 = random.random() * scale2 < frame_length

    if spawn1:
        agent_request = AgentRequest(portal1.get_id())
        agent_request.set_goal(portal2.get_id())
        agent_request.set_color(Color.BLUE)
        simulation.request_new_agent(agent_request)

    if spawn2:
        agent_request = AgentRequest(portal2.get_id())
        agent_request.set_goal(portal1.get_id())
        agent_request.set_color(Color.GREEN)
        simulation.request_new_agent(agent_request)

    simulation.step()

project.save("GeneratedProject.mm")
Sdk.fini()
