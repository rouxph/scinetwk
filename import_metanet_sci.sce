liste=stripblanks(["edge_number "     
  "edit_graph "      
  "edit_graph_menus "
  "girth "           
  "glist "           
  "graph"            
  "graph_2_mat "     
  "graph_complement "
  "graph_power "     
  "graph_simp "      
  "graph_sum "       
  "graph_union "     
  "knapsack "        
  "line_graph "      
  "mat_2_graph "     
  "neighbors "       
  "netclose "        
  "netwindow "       
  "netwindows "      
  "node_number "     
  "nodes_degrees "   
  "pipe_network "    
  "plot_graph "      
  "predecessors "    
  "show_arcs "       
  "show_nodes "      
  "split_edge "      
  "subgraph "        
  "successors "      
  "supernode " ])';
  
  for fic=liste 
      if ls(fic+".sci")==[] then
          disp(fic+".sci")
          try 
          unix_w("cp ~/.wine/drive_c/Program\ Files/scicoslab-4.4.1/macros/metanet/"+fic+".sci  .")
      catch disp("=>nofile")
          end
      end
      
  end
