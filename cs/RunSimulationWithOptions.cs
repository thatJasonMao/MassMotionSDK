using Oasys.MassMotion;
using System;
using System.Diagnostics;
using System.Collections.Generic;

class RunSimulationWithOptions
{
    public static void Main(string[] args)
    {
        Sdk.Init();

        var project = Project.Open("..\\Projects\\SdkSkeleton.mm");

        var startId1 = project.GetPortal("StartPortal1").GetId();
        var startId2 = project.GetPortal("StartPortal2").GetId();
        var startId3 = project.GetPortal("StartPortal3").GetId();

        var endId1 = project.GetPortal("EndPortal1").GetId();
        var endId2 = project.GetPortal("EndPortal2").GetId();
        var endId3 = project.GetPortal("EndPortal3").GetId();

        var floorId1 = project.GetFloor("StartFloor1").GetId();
        var floorId2 = project.GetFloor("StartFloor2").GetId();
        var floorId3 = project.GetFloor("StartFloor3").GetId();

        var options1 = new SimulationOptions();

        var options2 = new SimulationOptions();
        options2.SetRandomSeed(42);

        var options3 = new SimulationOptions();
        options3.SetThreadCount(1);

        var options4 = new SimulationOptions();
        options4.SetRandomSeed(42);
        options4.SetThreadCount(1);

        var optionsList = new List<SimulationOptions>() {options1, options2, options3, options4};

        for (int i = 0; i < optionsList.Count; i++)
        {
            var runName = String.Format("OptionsRun{0}", i + 1);
            optionsList[i].AddExtraGoal(endId1);
            optionsList[i].AddExtraGoal(endId2);
            optionsList[i].AddExtraGoal(endId3);
            var simulation = Simulation.Create(project, runName, runName + ".mmdb", optionsList[i]);

            Console.WriteLine(String.Format("Running {0}", runName));

            while (!simulation.IsDone())
            {
                if (simulation.GetClock().GetCurrentSecond() < 3 * 60)
                {
                    if (simulation.GetPopulation(floorId1) < 100)
                    {
                        var agentRequest = new AgentRequest(startId1);
                        agentRequest.SetGoal(endId1);
                        simulation.RequestNewAgent(agentRequest);
                    }

                    if (simulation.GetPopulation(floorId2) < 100)
                    {
                        var agentRequest = new AgentRequest(startId2);
                        agentRequest.SetGoal(endId2);
                        simulation.RequestNewAgent(agentRequest);
                    }

                    if (simulation.GetPopulation(floorId3) < 100)
                    {
                        var agentRequest = new AgentRequest(startId3);
                        agentRequest.SetGoal(endId3);
                        simulation.RequestNewAgent(agentRequest);
                    }
                }

                simulation.Step();
            }
        }

        Sdk.Fini();
    }
}
