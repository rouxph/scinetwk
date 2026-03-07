function [g1]=add_node(g,xy,name)
        //  SciNetwk 
        //  add_node:  adds a disconnected node to a graph
        // 
        // Syntax
        //  g1 = add_node(g,[xy,name])
        //
        // Parameters
        // 
        //   g: graph list 
        //  xy: optional row vector of coordinates of new node 
        //  name: optional name of the added node 
        //  g1: graph list of the new graph with the added node 
        //
        // Description
        //   add_node adds a disconnected node to graph g and returns the new graph g1. 
        //The coordinates of the new node can be given as a row vector of coordinates in xy. If the nodes of graph g have no coordinates (elements node_x and node_y are []), to give xy has no effect. If the nodes of graph g have coordinates and xy is not given, the new node has (0,0) as coordinates. 
        //
        //If name is given, it is the name of the new node, otherwise the number of nodes plus 1 is taken as the name of the new node. 
        //
        // Examples
        //ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 11 12 13 13 13 14 15 16 16 17 17];
        //he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 15 12 13 9 10 14 11 16 1 17 14 15];
        //g=make_graph('foo',1,17,ta,he);
        //g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
        //g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
        //show_graph(g);
        //n=g('node_number');
        //g1=add_node(g,[270 140]);
        //g1('node_color')=[ones(1,n) 11];
        //show_graph(g1);
        //
        // See also
        //   add_edge
        //   delete_arcs
        //   delete_nodes,       
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
        
        
        [lhs,rhs]=argn(0)
        select rhs
        case 1 then
          xy=[]
          name=0
        case 2 then
          if type(xy)==1 then name=0
          else name=xy, xy=[], end
        else
          if rhs<>3 then error(39), end
        end
        // check xy
        if xy<>[] then
          s=size(xy);
          if (s(1)<>1|s(2)<>2) then
            error('""xy"" must be a row vector with size 2')
          end
        end
        // check name
        if name<>0 then
          if type(name)<>10|prod(size(name))<>1 then
            error('""name"" must be a string')
          end
        end
        // adding a node at the (x,y) position with default values
        g1=g;n=g('node_number');
        g1('node_number')=n+1;
        if (g('node_name')<>[]) then
          if name==0 then 
            g1('node_name')=[g1('node_name') string(n+1)];
          else 
            g1('node_name')=[g1('node_name') name];
          end
        else
          if name<>0 then 
            g1('node_name')=[string(1:n) name]
          end
        end;
        if (g('node_type')<>[]) then g1('node_type')=[g1('node_type') 0];end;
        if g('node_x')<>[]&g('node_y')<>[] then
          if xy<>[] then
            g1('node_x')=[g1('node_x') xy(1)];
            g1('node_y')=[g1('node_y') xy(2)];
          else // change this to add node by extending the graph
              xmax=max(g1.node_x)
              xmin=min(g1.node_x)
              ymax=max(g1.node_y)
              ymin=min(g1.node_y)
            g1('node_x')=[g1('node_x') xmax+g1.default_node_diam+(xmax-xmin)/n];
            g1('node_y')=[g1('node_y') ymax];
          end
        end
        if (g('node_color')<>[]) then g1('node_color')=[g1('node_color') 2];end;
        if (g('node_diam')<>[]) then 
          g1('node_diam')=[g1('node_diam') g1('default_node_diam')];
        end;
        if (g('node_border')<>[]) then 
          g1('node_border')=[g1('node_border') g1('default_node_border')];
        end;
        if (g('node_font_size')<>[]) then 
          g1('node_font_size')=[g1('node_font_size') g1('default_font_size')];
        end;
        if (g('node_demand')<>[]) then g1('node_demand')=[g1('node_demand') 0];end;
        if (g1('node_label')<>[]) then
          g1('node_label')=[g1('node_label') string(n+1)];
        end;
endfunction
