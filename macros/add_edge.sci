function [g1]=add_edge(i,j,g)
        //  SciNetwk 
        // add_edge : adds an edge or an arc between two nodes
        // 
        // Syntax
        //  [g1]=add_edge(i,j,g)
        //
        // Parameters
        // 
        //    
        //    i : integer, number of start node
        //    j : integer, number of end node
        //    g : graph list
        //    g1 : graph list of the new graph with the added edge
        //
        // Description
        //    add_edge returns the graph g1 with a new edge from node number i to node number j . If the graph is directed, the edge is an arc. The number of edges plus 1 is taken as the name of the new edge.
        //
        // Examples
        //ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 11 12 13 13 13 14 15 16 16 17 17];
        //he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 15 12 13 9 10 14 11 16 1 17 14 15];
        //g=make_graph('foo',1,17,ta,he);
        //g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
        //g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
        //show_graph(g);
        //g=add_edge(1,7,g);
        //g('edge_color')=[ones(ta) 11];
        //show_graph(g);
 
        //
        // See also
        //   add_node 
        //   delete_arcs
        //   delete_nodes ,  
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
        
        [lhs,rhs]=argn(0)
        if rhs<>3 then error(39), end
        n=g('node_number')
        ma=prod(size(g('tail')))
        // check i and j
        if prod(size(i))<>1 then
          error('First argument must be a scalar')
        end
        if (i<1|i>n) then
          error(string(i)+' is not a node number')
        end
        if prod(size(j))<>1 then
          error('Second argument must be a scalar')
        end
        if (j<1|j>n) then
          error(string(j)+' is not a node number')
        end
        // adding an edge from node i to node j
        g1=g;
        g1('tail')=[g('tail') i]; g1('head')=[g('head') j];
        if g('edge_name')<>[] then g1('edge_name')=[g('edge_name') string(ma+1)];end;
        if g('edge_color')<>[] then g1('edge_color')=[g('edge_color') 1];end;
        if g('edge_width')<>[] then
          g1('edge_width')=[g('edge_width') g('default_edge_width')];
        end;
        if g('edge_hi_width')<>[] then
          g1('edge_hi_width')=[g('edge_hi_width') g('default_edge_hi_width')];
        end;
        if g('edge_font_size')<>[] then
          g1('edge_font_size')=[g('edge_font_size') g('default_font_size')];
        end;
        if g('edge_length')<>[] then g1('edge_length')=[g('edge_length') 0];end;
        if g('edge_cost')<>[] then g1('edge_cost')=[g('edge_cost') 0];end;
        if g('edge_min_cap')<>[] then g1('edge_min_cap')=[g('edge_min_cap') 0];end;
        if g('edge_max_cap')<>[] then g1('edge_max_cap')=[g('edge_max_cap') 0];end;
        if g('edge_q_weight')<>[] then g1('edge_q_weight')=[g('edge_q_weight') 0];end;
        if g('edge_q_orig')<>[] then g1('edge_q_orig')=[g('edge_q_orig') 0];end;
        if g('edge_weight')<>[] then g1('edge_weight')=[g('edge_weight') 0];end;
        // following should be suppressed or optionnal argument "label" ?""
//        if g('edge_label')<>[] then
//          g1('edge_label')=[g('edge_label') string(ma+1)];
//        end;
endfunction
