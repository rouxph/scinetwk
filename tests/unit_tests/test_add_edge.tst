G=make_graph("test_g",1,2,[],[])
G1=add_edge(1,2,G)
assert_checkequal(G1.head,[2])
assert_checkequal(G1.tail,[1])
