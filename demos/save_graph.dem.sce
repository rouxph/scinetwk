mode(1)
//
// Demo of save_graph.sci
//

tail=[3 7 2 2 1 5 2 6 7 6 4 6];
head=[7 2 3 1 3 1 5 2 6 5 5 4];
G = make_graph('G',1,7,tail,head);
save_graph(G,'file_name_tosave_G.sce')
halt()   // Press return to continue
 
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//
