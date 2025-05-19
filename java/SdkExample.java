import java.util.Random;
import java.util.List;

import com.oasys.massmotion.*;

class SdkExample
{
    public static void main(String[] args)
    {
        // Default MassMotion simulation frame rate
        int fps = 5;

        Sdk.init();

        Project project = Project.open("..\\Projects\\SdkSkeleton.mm");

        Profile defaultProfile = project.getProfile("DefaultProfile");

        Portal startPortal1 = project.getPortal("StartPortal1");
        Portal startPortal2 = project.getPortal("StartPortal2");
        Portal startPortal3 = project.getPortal("StartPortal3");

        Portal endPortal1 = project.getPortal("EndPortal1");
        Portal endPortal2 = project.getPortal("EndPortal2");
        Portal endPortal3 = project.getPortal("EndPortal3");

        Floor startFloor1 = project.getFloor("StartFloor1");
        Floor startFloor2 = project.getFloor("StartFloor2");
        Floor startFloor3 = project.getFloor("StartFloor3");

        Floor endFloor1 = project.getFloor("EndFloor1");
        Floor endFloor2 = project.getFloor("EndFloor2");
        Floor endFloor3 = project.getFloor("EndFloor3");

        Link link1 = project.getLink("Link1");
        Link link2 = project.getLink("Link2");
        Link link3 = project.getLink("Link3");

        Task waitTask = new WaitForeverTask(new SpreadOutWaitStyle());

        SimulationOptions simulationOptions = new SimulationOptions();
        simulationOptions.addExtraGoal(endPortal1.getId());
        simulationOptions.addExtraGoal(endPortal2.getId());
        simulationOptions.addExtraGoal(endPortal3.getId());
        Simulation simulation = Simulation.create(project, "JavaRun", "JavaRun.mmdb", simulationOptions);

        Random random = new Random(1234);

        System.out.println("Running...");
        while (!simulation.isDone()) {
            int currentFrame = simulation.getCurrentFrame();
            List<Agent> allAgents = simulation.getAllAgents();
            if (currentFrame % 100 == 0) {
                System.out.println(String.format("Frame %d", currentFrame));
            }

            // Request one agent per second at each portal on average
            if (random.nextFloat() < 1.0 / fps) {
                AgentRequest request1 = new AgentRequest(startPortal1.getId());
                request1.setColor(Color.getMAGENTA());
                request1.setGoal(endPortal1.getId());
                simulation.requestNewAgent(request1);

                AgentRequest request2 = new AgentRequest(startFloor2.getId());
                request2.setColor(Color.getGREEN());
                request2.setGoal(endPortal2.getId());
                simulation.requestNewAgent(request2);

                AgentRequest request3 = new AgentRequest(startPortal3.getId());
                request3.setColor(Color.getBLUE());
                request3.setGoal(endPortal3.getId());
                simulation.requestNewAgent(request3);
            }

            // Close first link for 2 seconds every 10 seconds
            if (currentFrame % (10 * fps) > (8 * fps)) {
                simulation.closeGate(link1.getId());
            } else {
                simulation.resetGate(link1.getId());
            }

            // Remove all agents entering EndFloor2
            for (Agent agent: allAgents) {
                if (agent.getCurrentFloorId().equals(endFloor2.getId())) {
                    agent.exitSimulation();
                }
            }

            // Have agents in EndFloor3 just wait around until they are removed
            for (Agent agent: allAgents) {
                if (agent.getCurrentFloorId().equals(endFloor3.getId())) {
                    agent.clearTasks();
                    agent.addTaskAsActive(waitTask);
                }
            }

            int startFloor3Population = simulation.getPopulation(startFloor3.getId());
            if (startFloor3Population > 30) {
                // When population on StartFloor3 reaches a threshold, open the
                // gate and remove all agents on EndFloor3
                simulation.openGate(link3.getId());
                for (Agent agent: allAgents) {
                    if (agent.getCurrentFloorId().equals(endFloor3.getId())) {
                        agent.exitSimulation();
                    }
                }
            } else if (startFloor3Population < 10) {
                // When population on StartFloor3 drops below a threshold, close
                // the gate again
                simulation.closeGate(link3.getId());
            }

            // Advance the simulation by one frame: move existing agents and
            // spawn new agents
            simulation.step();
        }

        Sdk.fini();
    }
}
