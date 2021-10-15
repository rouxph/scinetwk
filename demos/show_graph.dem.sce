mode(1)
//
// Demo of show_graph.sci
//

ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 11 12 13 13 13 14 15 16 16 17 17 9];
he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 15 12 13 9 10 14 11 16 1 17 14 15 9];
g=make_graph('foo',1,17,ta,he);
g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
g.node_color=2+pmodulo(1:17,5)
g.node_diam(:)=40;
g.edge_label="$e_{"+string(1:length(ta))+"}$"
g.edge_font_size(:)=2;
show_graph(g)
//========= E N D === O F === D E M O =========//
