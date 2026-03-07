function fields=graph_fields()
    //  SciNetwk 
    // 
    // Syntax
    // fields=graph_fields()
    //
    // Parameters
    // G: is a mlist (type is "graph") with 31 data fields
    // fields: string matrix
    //
    // Description
    // generate the graph fields list
    // to avoid repetitions in source code
    //
    // name:- the name of the graph 
    //      -it is a string with a maximum of 80 characters 
    //directed:- flag giving the type of the graph 
    //         -it is equal to 1 (graph directed) or equal to 0 (graph undirected) 
    //node_number:- number of nodes 
    //tail:- row vector of the tail node numbers 
    //head:- row vector of the head node numbers 
    //node_name:- row vector of node names 
    //          -the names of the nodes must be different 
    //          -default is the node numbers as node names 
    //node_type:- row vector of the node types 
    //          -the type is an integer from 0 to 2, default is 0 (plain node): 
    //          -0 = plain node 
    //          -1 = sink node 
    //           -2 = source node 
    //node_x:- row vector of the x coordinate of the nodes 
    //       -default is computed 
    //node_y:- row vector of the y coordinate of the nodes 
    //       -default is computed 
    //node_color:- row vector of the node colors 
    //           -the color is an integer from 1 to ...
    //           -1 = black, 2= white(default), 3 to n-2 given by rainbow(n)
    //node_diam:- row vector of the size of the node diameters in pixels 
    //          -a node is drawn as a circle 
    //          -default is the value of element default_node_diam  
    //node_border:- row vector of the size of the node borders in pixels 
    //            -a node is drawn as a circle 
    //            -default is the value of element default_node_border  
    //node_font_size:- row vector of the size of the font used to draw the name of the node 
    //              -you can choose 8, 10, 12, 14, 18 or 24 
    //              -default is the value of element default_font_size  
    //node_demand:- row vector of the node demands 
    //              -default is 0 
    //edge_name:- row vector of the edge names 
    //          -it is better that the names of the edges are different, but this is not an error 
    //          -default is the edge numbers as edge names 
    //edge_color:- row vector of the edge colors 
    //           -the color is an integer (see node_color) 
    //           -default is 1 (default foreground) 
    //edge_width:- row vector of the size of the edge widths in pixels 
    //          -default is the value of element default_edge_width  
    //edge_hi_width:- row vector of the size of the highlighted edge widths in pixels 
    //          -default is the value of element default_edge_hi_width  
    //edge_font_size:- row vector of the size of the fonts used to draw the name of the edge 
    //              -you can choose 8, 10, 12, 14, 18 or 24 
    //              -default is the value of element default_font_size  
    //edge_length:- row vector of the edge lengths 
    //              -default is 1
    //edge_cost:- row vector of the edge costs 
    //          -default is 0 
    //edge_min_cap:- row vector of the edge minimum capacities 
    //              -default is 0 
    //edge_max_cap:- row vector of the edge maximum capacities 
    //              -default is 1 
    //edge_q_weight:- row vector of the edge quadratic weights 
    //              -default is 0 
    //edge_q_orig:- row vector of the edge quadratic origins 
    //              -default is 0 
    //edge_weight:- row vector of the edge weights 
    //              -default is 0 
    //default_node_diam:- default size of the node diameters of the graph 
    //                  -default is 40 pixels 
    //default_node_border:- default size of the node borders of the graph 
    //                      -default is 2 pixels 
    //default_edge_width:- default size of the edge widths of the graph 
    //                      -default is 1 pixel 
    //default_edge_hi_width:- default size of the highlighted edge widths of the graph 
    //                      -default is 2 pixels 
    //default_font_size:- default size of the font used to draw the names of nodes and edges 
    //                  -default is 2 
    //node_label:- row vector of node labels 
    //edge_label:- row vector of edge labels 
    //
    // Examples
    //    graph_fields()
    //
    //
    // See also
    //  graph_fields
    //  make_graph
    //
    // Authors
    //  Philippe Roux
    //
    
    fields=["graph";
    "name";
    "directed";
    "node_number";
    "tail";
    "head";
    "node_name";
    "node_type";
    "node_x";
    "node_y";
    "node_color";
    "node_diam";
    "node_border";
    "node_font_size";
    "node_demand";
    "edge_name";
    "edge_color";
    "edge_width";
    "edge_hi_width";
    "edge_font_size";
    "edge_length";
    "edge_cost";
    "edge_min_cap";
    "edge_max_cap";
    "edge_q_weight";
    "edge_q_orig";
    "edge_weight";
    "default_node_diam";
    "default_node_border";
    "default_edge_width";
    "default_edge_hi_width";
    "default_font_size";
    "node_label";
    "edge_label"]
endfunction
