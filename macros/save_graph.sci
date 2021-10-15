function save_graph(G,path)
    //  SciNetwk 
    // 
    // Syntax
    // G=make_graph(name,n,directed,head,tail)
    //
    // Parameters
    // path: string, file name
    // G: is a mlist (type is "graph") with 31 data fields
    //
    // Description
    //  save graph structure into a text file
    //  use *.graph extension but its just *.sce file
    //  exec the file in scilab to load the graph 
    //
    // Examples
    //    tail=[3 7 2 2 1 5 2 6 7 6 4 6];
    //    head=[7 2 3 1 3 1 5 2 6 5 5 4];
    //    G = make_graph('G',1,7,tail,head);
    //    save_graph(G,'file_name_tosave_G.sce')
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
      cmd=["//metanet graph structure"]
      //start with empty graph
      cmd($+1)=[G.name+"=make_graph('""+G.name+"'",1,1,[],[]);"]
      // overwrite each field
      for field= fields'
          if type(G(field))==1 then
             cmd($+1)=G.name+"."+field+"=["+strcat(string(G(field)),',')+"];"
         else //strings
             cmd($+1)=G.name+"."+field+"=["+strcat("'""+G(field)+"'"",',')+"];"
          end
      end
      //write command to file
      mputl(cmd,path)
endfunction
