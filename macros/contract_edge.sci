function [g1]=contract_edge(i,j,g)
        //  SciNetwk 
        // contract_edge - contracts edges between two nodes 
        // 
        // Syntax
        //  g1 = contract_edge(i,j,g)
        //
        // Parameters
        // 
        //  i: integer, number of start or end node of edge 
        //j: integer, number of end or start node of edge 
        //g: graph list 
        //g1: graph list of the new graph 
        //
        // Description
        //  contract_edge returns the graph g1, the edges between the nodes number i and j being deleted, the nodes being reduced to one node with the same name as node i and located at the middle point between the 2 previous nodes. 
        //
        // Examples
        //ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 10 10 11 12 13 13 13 14 15 16 16 17 17];
        //he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 13 13 15 12 13 9 10 14 11 16 1 17 14 15];
        //g=make_graph('foo',1,17,ta,he);
        //g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
        //g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
        //show_graph(g);
        //g1=contract_edge(10,13,g);
        //show_graph(g1,'new');
        //
        // See also
        //   add_edge
        //   add_node
        //  delete_arcs
        //  delete_nodes,        
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
        
        
        [lhs,rhs]=argn(0)
        if rhs<>3 then error(39), end
        //contracting the edges between node i and node j
        g1=delete_arcs([i j],g);
        g1=delete_arcs([j i],g1);
        ta=g1('tail');he=g1('head');
        ii=find(ta==j);ta(ii)=i*ones(ii);
        ii=find(he==j);he(ii)=i*ones(ii);
        g1('tail')=ta;g1('head')=he;
        xnodes=g('node_x');ynodes=g('node_y');
        if xnodes<>[] then
          x1=xnodes(i);x2=xnodes(j);
          y1=ynodes(i);y2=ynodes(j);
        else
          x1=[],x2=[],y1=[],y2=[]
        end
        if (x1<>[]) then 
          xnodes(i)=0.5*(x1+x2);
          g1('node_x')=xnodes;
        end;
        if (y1<>[]) then
          ynodes(i)=0.5*(y1+y2);
          g1('node_y')=ynodes;
        end;
        g1=delete_nodes(j,g1);
endfunction
