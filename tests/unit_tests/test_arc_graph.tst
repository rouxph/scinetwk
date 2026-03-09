G=make_graph("test_g",1,3,[1 2],[2 3])
G.node_x=[0 100 50]
G.node_y=[0 0 50]
G1=arc_graph(G)
assert_checkequal(G1.node_number,2)
assert_checkequal(G1.node_x,[50,75])
assert_checkequal(G1.node_y,[0,25])   
assert_checkequal(G1.head,[2])
assert_checkequal(G1.tail,[1])
