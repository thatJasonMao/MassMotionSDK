import sys
import ast

try:
    import plotly
    import plotly.plotly as py
    import plotly.graph_objs as go
except ImportError:
    print( 'ERROR: Could not import plotly. Try running pip install -r requirements.txt' )
    sys.exit( -1 )

from massmotion_11_0 import *

def plot_from_data( graph_title, x_vals, y_vals, normalized = 0 ):
    colours = [ 'rgb(26, 15, 226)', 'rgb(50, 242, 242)', 'rgb(18, 114, 14)', 'rgb(173, 173, 17)', 'rgb(183, 131, 11)', 'rgb(183, 10, 10)' ]
    labels = [ 'LOS A', 'LOS B', 'LOS C', 'LOS D', 'LOS E', 'LOS F' ]
    traces = []
    
    num_series = len( x_vals )
    for i in range( num_series ):
        traces.append( go.Scatter( 
        x = x_vals[i],
        y = y_vals[i],
        line = dict( width = 0.5, color = colours[i]),
        mode = 'lines',
        connectgaps = True,
        stackgroup = 'one',
        name = labels[i],
        groupnorm = "percent" if normalized else "" ) )

    x_axis_title = "Time (s)"
    y_axis_title = "Agent Count" + ( " (%)" if normalized else "" )
    layout = go.Layout(
        title = graph_title,
        autosize = True,
        showlegend = True,
        xaxis = dict (
            title = x_axis_title,
            showline = True,
            showgrid = True,
            showticklabels = True,
            ticks = 'outside',
            ticklen = 10,
            dtick = 5
            ),

        yaxis = dict(
            title = y_axis_title,
            showline = True,
            showgrid = True,
            showticklabels = True,
            ticklen = 10,
            dtick = 5
            ),
    )
    filename = ( y_axis_title + 'Vs' + x_axis_title + '.html' ).replace( ' ', '' )
    fig = go.Figure( data = traces, layout = layout )
    plotly.offline.plot( fig, filename = filename )

def run_simulation():
    Sdk.init()
    project = Project.open( '../../projects/SimpleJourney.mm' )
    entry_portal_id = project.get_portal( 'StartPortal' ).get_id()
    exit_portal_id = project.get_portal( 'EndPortal' ).get_id()

    seek_task = SeekPortalTask(exit_portal_id)
    exit_task = ExitTask()

    time_range = TimeRange( 0, 91 )

    simulation = Simulation.create( project, 'PyGraphPlotting', 'PyGraphPlotting.mmdb' )
    sim_ID = project.get_object( "PyGraphPlotting" ).get_id()
    agent_density_graph_query = project.create_agent_density_graph_query( "AgentDensityGraphQuery", sim_ID )
    agent_density_graph_query.set_time_range( time_range )
    num_agents_to_create = 100

    while not simulation.is_done():
        if num_agents_to_create:
            agent_request = AgentRequest( entry_portal_id )
            agent_request.set_goal( exit_portal_id )

            new_agent = simulation.request_new_agent( agent_request )

            num_agents_to_create = num_agents_to_create - 1

        frame_summary = simulation.step()

        for agent in frame_summary.get_created_agents():
            agent.add_task_as_last(seek_task)
            agent.add_task_as_last(exit_task)

    agent_density_graph = agent_density_graph_query.evaluate()
    series_list = agent_density_graph.get_series()

    x_data = []
    y_data = []

    for series in series_list :
        x_data_points = []
        y_data_points = []
        for vector in series.get_values() :
            x_data_points.append( vector.get_x() )
            y_data_points.append( vector.get_z() )

        x_data.append( x_data_points )
        y_data.append( y_data_points )

    plot_from_data( "Agent Density Graph", x_data, y_data, normalized = 0 )

    Sdk.fini()

if __name__ == "__main__":
    run_simulation()
