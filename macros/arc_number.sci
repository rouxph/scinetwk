function [m]=arc_number(g)
        //  SciNetwk 
        //  arc_number:  number of arcs of a graph 
        // 
        // Syntax
        //   ma = arc_number(g) 
        //
        // Parameters
        // 
        //   g: graph list 
        //  ma: integer, number of arcs 
        //
        // Description
        //  arc_number returns the number ma of arcs of the graph. If the graph is directed, it is the number of edges. If the graph is undirected, it is twice the number of edges. 
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
        //   edge_number
        //   node_number       
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
        
        
        [lhs,rhs]=argn(0)
        if rhs<>1 then error(39), end
        ma=prod(size(g('tail')))
        if g('directed')==1 then m=ma, else m=2*ma, end
endfunction
