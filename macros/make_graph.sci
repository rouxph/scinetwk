function G=make_graph(name,directed,n,head,tail)
    //  SciNetwk 
    // 
    // Syntax
    // G=make_graph(name,n,directed,head,tail)
    //
    // Parameters
    // name: string
    // n: int (node_number)
    // directed: 1 or 0  (graph is directed or not)
    // head,tail: int matrix of same length m
    //            graph edges are (head(i),tail(i))
    // G: is a mlist (type is "graph") with 31 data fields
    //
    // Description
    // create the graph structure 
    //
    // Examples
    //    tail=[3 7 2 2 1 5 2 6 7 6 4 6];
    //    head=[7 2 3 1 3 1 5 2 6 5 5 4];
    //    G = make_graph('G',1,7,tail,head);
    //
    //
    // See also
    //  graph_fields
    //
    // Authors
    //  Philippe Roux
    //

    
      fields=graph_fields();
      // line vector
      head=head(:)'
      tail=tail(:)'
      // default display values
      default_node_diam=40
      default_node_border=2
      default_edge_width=1
      default_edge_hi_width=2
      default_font_size=2
      // node informations            
      if n==0 then 
          error("graph must have at least one node!\n")
      end      
      n_max=max([head,tail])
      if n_max>n then 
          disp(n,n_max)
          n=n_max
          warning("inconsistant edge list! changing node number to n="+string(n_max))
      end
      node_name=string(1:n)//default name= number
      node_type=zeros(1:n)//default type shrink =1 source=2 other 0
      node_x=zeros(1:n)//x coordinate
      node_y=zeros(1:n)//y coordinnate
      node_color=8*ones(1:n)// default color=white
      node_diam=default_node_diam*ones(1:n)// diameter for node plot
      node_border=default_node_border*ones(1:n)// border of the node circle
      node_font_size=default_font_size*ones(1:n)// font size for node name
      node_demand=zeros(1:n)
      node_label=node_name
      // init edges information
      m=length(head)//edge number
      if length(tail)<>m then 
          error("tail and head has different size!\n size(head,tail)=(%d,%d)\n",m,length(tail))
      end
      edge_name=string(1:m)// default edge name is there number
      edge_color=ones(1:m)//default_color black
      edge_width=default_edge_width*ones(1,m)// default edge width is 3
      edge_hi_width=default_edge_hi_width*ones(1,m)
      edge_font_size=default_font_size*ones(1,m)
      edge_length=ones(1,m)
      edge_cost=zeros(1,m)
      edge_min_cap=zeros(1,m)
      edge_max_cap=3*ones(1,m)
      edge_q_weight=zeros(1:m)
      edge_q_orig=zeros(1:m)
      edge_weight=zeros(1:m)
      edge_label=strsplit(ascii(32*ones(1:m)))'
      if m==0 then edge_label=[]
      end
      // create graph
    G=tlist(fields,name,directed,n,head,tail,node_name,node_type,node_x,node_y,node_color,node_diam,node_border,node_font_size,node_demand,edge_name,edge_color,edge_width,edge_hi_width,edge_font_size,edge_length,edge_cost,edge_min_cap,edge_max_cap,edge_q_weight,edge_q_orig,edge_weight,default_node_diam,default_node_border,default_edge_width,default_edge_hi_width,default_font_size,node_label,edge_label)
endfunction

