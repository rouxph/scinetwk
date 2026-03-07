function [g1]=arc_graph(g)
        //  SciNetwk
        //  arc_graph : graph with nodes corresponding to arcs 
        // 
        // Syntax
        //  g1 = arc_graph(g)
        //
        // Parameters
        // 
        //  g: graph list of the old graph 
        //  g1: graph list of the new graph
        //
        // Description
        //   arc_graph returns the directed graph g1 with the nodes corresponding to the arcs of the directed graph g. g1 is defined in the following way: 
        //
        //- its nodes correspond to the arcs of g 
        //
        //- 2 nodes of the new graph are adjacent if and only if the corresponding arcs of the graph g are consecutive. 
        //
        //The coordinates of the nodes of g1 are given by the middle points of the corresponding edges of g. 
        //
        //If such an arc graph does not exist, an empty vector is returned. 
        //
        // Examples
        //ta=[1 1 2 4 4 5 6 7 2 3 5 1];
        //he=[2 6 3 6 7 8 8 8 4 7 3 5];
        //g=make_graph('foo',1,8,ta,he);
        //g('node_x')=[281  284  360  185  405  182  118  45];
        //g('node_y')=[262  179  130  154  368  248  64  309];
        //show_graph(g);
        //g1=arc_graph(g);
        //show_graph(g1,'new');
        //
        // See also
        //   line_graph       
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
  
        [lhs,rhs]=argn(0)
        if rhs<>1 then error(39), end
        // check g
        if g('directed')<>1 then
          error('The graph must be directed')
        end
        ma=prod(size(g('tail')));
        ta=g('tail');he=g('head');
        ta1=[];he1=[];
        for i=1:ma,
          ist=ta(i);iar=he(i);
          ij=find(ta==iar);
          ka=i*ones(ij);
          ta1=[ta1 ka];he1=[he1 ij];
        end;
        if (ta1==[]|he1==[]) then
          g1=[]; return
        end
        g1=make_graph('foo',1,ma,ta1,he1);
        xi=g('node_x');yi=g('node_y');
        if (xi<>[]) then
          x1i=0.5*(xi(ta)+xi(he));
          g1('node_x')=x1i;
        end
        if (yi<>[]) then
          y1i=0.5*(yi(ta)+yi(he));
          g1('node_y')=y1i;
        end
endfunction
