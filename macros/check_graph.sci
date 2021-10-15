function check_graph(G)
    //  SciNetwk 
    // 
    // Syntax
    // check_graph(G)
    //
    // Parameters
    // G: is a mlist (type is "graph") with 31 data fields
    //
    // Description
    //  check if G has a correct graph structure, use it other functions to check arguments
    //
    // Examples
    //    tail=[3 7 2 2 1 5 2 6 7 6 4 6];
    //    head=[7 2 3 1 3 1 5 2 6 5 5 4];
    //    G = make_graph('G',1,7,tail,head);
    //    check_graph(G)
    //
    //
    // See also
    //  graph_fields
    //  make_graph
    //
    // Authors
    //  Philippe Roux
    //
    
    fields=graph_fields();
    //***************************************
    //check G(1) and strings/scalar structure
    //***************************************
    no_empty=((G.head<>[])&(G.tail<>[]))//problem when no edges
    if ~and(G(1)==fields) then
        whereami()
        error("G has not a graph structure!\n")
    end
    fields(1)=[]//exclude "graph" from now
    str_fields=fields(grep(fields,["name","label"]))
    for field= fields'
        if (grep(str_fields,field)<>[]) then //field of strings
            if no_empty&(type(G(field))<>10) then
                whereami()
                error("G.%s is not a string ! type : %s\n",typeof(G(field)))
            end
        else //should be scalar
            if (type(G(field))<>1) then
                disp(field)
                whereami()
                error("G.%s is not a scalar list ! type : %s\n",typeof(G(field)))
            elseif grep(field,["node_x","node_y"])<>[] then 
                //should be positive integers (except (x,y) coordinnates)
                L=G(field)
                if or(pmodulo(L,1)<>0)|or(L<0) then 
                    whereami()
                    error("G.%s is not a list of positive integers! \n")
                end
            end
        end
    end
    //*******************************
    //nodes  informations
    //*******************************
    n=G.node_number
    if (n<=0) then // case n=0
        whereami()
        error("G.node_number is not a positive integer! n : %f\n",n)
    end
    node_fields=fields(grep(fields,'node_'))
    for field= node_fields'
        nf=prod(size(G(field)))
        if (field<>"node_number")&&(grep(field,"default")==[])&&(nf<>n) then
            disp(field)
            whereami()
            error("G.%s is 1x%d matrix (should be 1x%d)!\n",field,nf,n)
        end
    end
    //******************************
    //edges  informations 
    //******************************
    // tail and head must bien matrix of integers between 1 and n(node_number))
    if no_empty&&((min(G.head)<1)||(max(G.head)>n)) then
        whereami()
        error("G.head is not  a valid list of nodes  !\n head : \n %d\n ",head)
    end
    if no_empty&&((min(G.tail)<1)||(max(G.tail)>n)) then
        whereami()
        error("G.tail is not  a valid list of nodes  !\n head : \n %d\n ",,tail)
    end
    // tail and Head must have the same length
    [l1,c1]=size(G.head)
    [l2,c2]=size(G.tail)
    if l1*c1<>l2*c2 then
        whereami()
        error("G.tail and G.tail have incompatible sizes!\n  %dx%d and %dx%d",l1,c1,l2,c2)
    else m=l1*c1
        if no_empty&((l1<>1)|(l2<>1)) then
            warning("matrix in graph structure should be 1 line tables")
        end
    end
    // edge fields must be 1xm matrix
    edge_fields=fields(grep(fields,'edge_'))
    for field= edge_fields'
        mf=prod(size(G(field)))
        if (grep(field,"default")==[])&&(mf<>m) then
            disp(field)
            whereami()
            error("G.%s is 1x%d matrix (should be 1x%d) !\n",field,mf,m)
        end
    end
    //*********************************
    //default informations => scalars
    //*********************************
    default_fields=fields(grep(fields,'default_'))
    for field= default_fields'
        mf=prod(size(G(field)))
        if prod(size(G(field))<>1) then
            whereami()
            error("G.%s must be a singler integer !\n",field)
        end
    end
endfunction
