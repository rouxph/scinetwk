function [lp,la,ln]=adj_lists(g,n,tail,head)
        //  SciNetwk 
        // adj_lists - computes adjacency lists 
        // 
        // Syntax
        //  [lp,la,ls] = adj_lists(g)  
        //  [lp,la,ls] = adj_lists(directed,n,tail,head)
        //
        // Parameters
        // 
        //   g: graph list 
        //directed: integer, 0 (undirected graph) or 1 (directed graph) 
        //n: integer, the number of nodes of the graph 
        //tail: the row vector of the numbers of the tail nodes of the graph (its size is the number of edges of the graph) 
        //head: the row vector of the numbers of the head nodes of the graph (its size is the number of edges of the graph) 
        //lp: row vector, pointer array of the adjacency lists description of the graph (its size is the number of nodes of the graph + 1) 
        //la: row vector, arc array of the adjacency lists description of the graph (its size is the number of edges of the graph) 
        //ls: row vector, node array of the adjacency lists description of the graph (its size is the number of edges of the graph) 
        //
        // Description
        //   adj_lists computes the row vectors of the adjacency lists description of the graph g. It is also possible to give adj_lists the description of the graph given by the number of nodes n and the row vectors tail and head. 

        //
        // Examples
        //ta=[2 3 3 5 3 4 4 5 8];
        //he=[1 2 4 2 6 6 7 7 4];
        //g=make_graph('foo',1,8,ta,he);
        //g('node_x')=[129 200 283 281 128 366 122 333];
        //g('node_y')=[61 125 129 189 173 135 236 249];
        //show_graph(g);
        //[lp,la,ls]=adj_lists(g)
        //[lp,la,ls]=adj_lists(1,g('node_number'),ta,he)
        //
        // See also
        //   chain_struct
        //   graph_2_mat    
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
        [lhs,rhs]=argn(0)
        if rhs==1 then
          // g
          check_graph(g)
          directed=g('directed')
          n=g('node_number')
          tail=g('tail')
          head=g('head')
        else
          if rhs<>4 then error(39), end
          directed=g
          // check directed
          if directed<>1&directed<>0 then
            error('First argument must be 0 or 1')
          end
          // check n
          if prod(size(n))<>1|n<1
            error('Second argument must be greater than 1')
          end
          // check tail
          s=size(tail)
          if s(1)<>1 then
            error('Third argument must be a row vector')
          end
          ma=s(2)
          // check head
          s=size(head)
          if s(1)<>1 then
            error('Fourth argument must be a row vector')
          end
          if s(2)<>ma then
            error('""tail"" and ""head"" must have identical sizes')
          end
          // check tail and head
          if min(min(tail),min(head))<1|max(max(tail),max(head))>n then
            error('""tail"" and ""head"" do not represent a graph')
          end
        end
        // compute lp, la and ln
        if directed==1 then
            //[lp,la,ln]=m6ta2lpd(tail,head,n+1,n)
            la=[]// arc list
            lp=zeros(1,n+1),lp(1)=1//successors head
            m=length(g.tail)//arc number
            ln=[]//successors list
            for x=1:n//for each node
                S=successors(x,g)//x successors
                S=gsort(S,'g','i')//sorted in increasing order
                ln=[ln, S]//add successors to ln
                lp(x+1)=lp(x)+length(S)//place of first x+1 successor
                ind=[]
                for y=S
                    ind=[ind find((tail==x)&(head==y))]
                end
                
                printf("x=%d S=\n",x),disp(ind)
                la=[la  ind] // edge numbers list
            end
        else
          //[lp,la,ln]=m6ta2lpu(tail,head,n+1,n,2*ma)
           la=[]// arc list
            lp=zeros(1,n+1),lp(1)=1//successors head
            m=length(g.tail)//arc number
            ln=[]//successors list
            for x=1:n//for each node
                S=neighbors(x,g)//x neigbors
                S=S(find(S>=x))
                S=gsort(S,'g','i')//sorted in increasing order
                ln=[ln, S]//add successors to ln
                lp(x+1)=lp(x)+length(S)//place of first x+1 neigbors
                ind=[]
                for y=S
                    ind=[ind find(((tail==x)&(head==y))|((tail==y)&(head==x)))]
                end
                la=[la  ind] // edge numbers list
            end
        end
endfunction
