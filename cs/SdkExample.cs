using Oasys.MassMotion;
using System;
using System.Diagnostics;
using System.Collections.Generic;

class SdkExample
{
    public static void Main(string[] args)
    {
        // Default MassMotion simulation frame rate
        var fps = 5;

        Sdk.Init();

        var project = Project.Open("..\\Projects\\SdkSkeleton.mm");

        var defaultProfile = project.GetProfile("DefaultProfile");

        var startPortal1 = project.GetPortal("StartPortal1");
        var startPortal2 = project.GetPortal("StartPortal2");
        var startPortal3 = project.GetPortal("StartPortal3");

        var endPortal1 = project.GetPortal("EndPortal1");
        var endPortal2 = project.GetPortal("EndPortal2");
        var endPortal3 = project.GetPortal("EndPortal3");

        var startFloor1 = project.GetFloor("StartFloor1");
        var startFloor2 = project.GetFloor("StartFloor2");
        var startFloor3 = project.GetFloor("StartFloor3");

        var endFloor1 = project.GetFloor("EndFloor1");
        var endFloor2 = project.GetFloor("EndFloor2");
        var endFloor3 = project.GetFloor("EndFloor3");

        var link1 = project.GetLink("Link1");
        var link2 = project.GetLink("Link2");
        var link3 = project.GetLink("Link3");

		var waitTask = new WaitForeverTask(new SpreadOutWaitStyle());

        var simulationOptions = new SimulationOptions();
        simulationOptions.AddExtraGoal(endPortal1.GetId());
        simulationOptions.AddExtraGoal(endPortal2.GetId());
        simulationOptions.AddExtraGoal(endPortal3.GetId());
        var simulation = Simulation.Create(project, "CSharpRun", "CSharpRun.mmdb", simulationOptions);
        var random = new Random(1234);
        Console.WriteLine("Running...");
        while (!simulation.IsDone())
        {
            int currentFrame = simulation.GetCurrentFrame();
            List<Agent> allAgents = simulation.GetAllAgents();
            if (currentFrame % 100 == 0)
            {
                Console.WriteLine(String.Format("Frame {0}", currentFrame));
            }

            // Request one agent per second at each portal on average
            if (random.NextDouble() < 1.0 / fps)
            {
                var request1 = new AgentRequest(startPortal1.GetId());
                request1.SetColor(Color.RED);
                request1.SetGoal(endPortal1.GetId());
                simulation.RequestNewAgent(request1);

                var request2 = new AgentRequest(startFloor2.GetId());
                request2.SetColor(Color.DARK_GREEN);
                request2.SetGoal(endPortal2.GetId());
                simulation.RequestNewAgent(request2);
                
                var request3 = new AgentRequest(startPortal3.GetId());
                request3.SetColor(Color.BLUE);
                request3.SetGoal(endPortal3.GetId());
                simulation.RequestNewAgent(request3);
            }

            // Close first link for 2 seconds every 10 seconds
            if (currentFrame % (10 * fps) > (8 * fps))
            {
                simulation.CloseGate(link1.GetId());
            }
            else
            {
                simulation.ResetGate(link1.GetId());
            }

            // Remove all agents entering EndFloor2
            foreach (var agent in allAgents)
            {
                if (agent.GetCurrentFloorId() == endFloor2.GetId())
                {
                    agent.ExitSimulation();
                }
            }

            // Have agents in EndFloor3 just wait around until they are removed
            foreach (var agent in allAgents)
            {
                if (agent.GetCurrentFloorId() == endFloor3.GetId())
                {
                    agent.ClearTasks();
                    agent.AddTaskAsActive(waitTask);
                }
            }

            var startFloor3Population = simulation.GetPopulation(startFloor3.GetId());

            if (startFloor3Population > 30)
            {
                // When population on StartFloor3 reaches a threshold, open the
                // gate and remove all agents on EndFloor3
                simulation.OpenGate(link3.GetId());
                foreach (var agent in allAgents)
                {
                    if (agent.GetCurrentFloorId() == endFloor3.GetId())
                    {
                        agent.ExitSimulation();
                    }
                }
            }
            else if (startFloor3Population < 10)
            {
                // When population on StartFloor3 drops below a threshold, close
                // the gate again
                simulation.CloseGate(link3.GetId());
            }

            // Advance the simulation by one frame: move existing agents and
            // spawn new agents
            simulation.Step();
        }

        Sdk.Fini();
    }
}
