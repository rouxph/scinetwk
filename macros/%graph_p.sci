function %graph_p(G)
    // display graph informations
    
    if G.directed then
    mprintf("the grah '""+G.name+"'" is directed \n")
    else
    mprintf("the grah '""+G.name+"'" is not directed \n")
    end
    mprintf("node number : %d\n",G.node_number)
    mprintf("edge number : %d\n",length(G.tail))
    mprintf("more informations with "+G.name+".field\n(see "+G.name+"(1) for the list of fields)\n")
endfunction
