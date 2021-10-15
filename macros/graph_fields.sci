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
    // except in make_graph.sci
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
