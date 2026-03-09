G=make_graph("test_g",1,2,[1],[2])
G.node_x=[ 0 100]
G.node_y=[0 0]
G1=add_node(G,[50,100],"new")
assert_checkequal(G1.node_number,3)
assert_checkequal(G1.node_x,[0,100,50])
assert_checkequal(G1.node_y,[0,0,100])
assert_checkequal(G1.node_name(3),"new")
