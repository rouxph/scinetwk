mode(1)
//
// Demo of arc_graph.sci
//

ta=[1 1 2 4 4 5 6 7 2 3 5 1];
he=[2 6 3 6 7 8 8 8 4 7 3 5];
g=make_graph('foo',1,8,ta,he);
g('node_x')=[281  284  360  185  405  182  118  45];
g('node_y')=[262  179  130  154  368  248  64  309];
show_graph(g);
g1=arc_graph(g);
show_graph(g1,'new');
halt()   // Press return to continue
 
//========= E N D === O F === D E M O =========//
