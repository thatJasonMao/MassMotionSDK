from massmotion_11_0 import *
import sys

Sdk.init()

# Open project from file name specified at the command line
project = Project.open(sys.argv[1])

# Loop through a few different population multipliers
for index, multiplier in enumerate([ 0.2, 0.5, 1.0, 2.0, 5.0 ]):
    project.set_population_multiplier(multiplier)
    run_name = "Run" + str(index + 1)
    simulation = Simulation.create(project, run_name, run_name + ".mmdb")
    while not simulation.is_done():
        simulation.step()

Sdk.fini()
