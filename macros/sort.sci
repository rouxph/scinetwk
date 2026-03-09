function [L2,ind]=sort(L1)
    //  SciNetwk 
    //  gsort call for comlpatibility with scilab4
    // 
    // Syntax
    // sort(L)
    //
    // Parameters
    // L: list/vector 
    //
    // Description
    // sort the list L in decreasing order using gsort, 
    //
    // Examples
    //    L=grand(1,10,'uin',1,100)
    //    sort(L)

    //
    // See also
    //  gsort
    //
    // Authors
    //  Philippe Roux
    //
    [L2,ind]=gsort(L1,'g','d')
endfunction
