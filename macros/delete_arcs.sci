function [g1]=delete_arcs(ij,g)
        //  SciNetwk
        //  delete_arcs - deletes all the arcs or edges between a set of nodes 
        // 
        // Syntax
        //  g1 = delete_arcs(ij,g)
        //
        // Parameters
        // 
        //  g: graph list of the old graph 
        //  g1: graph list of the new graph
        //
        // Description
        //  ij: matrix of integers (number of nodes) 
        //g: graph list 
        //g1: graph list of the new graph without the arcs or edges defined by ij 
        //
        // Examples
        //ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 10 10 11 12 13 13 13 14 15 16 16 17 17];
       //he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 13 13 15 12 13 9 10 14 11 16 1 17 14 15];
        //g=make_graph('foo',1,17,ta,he);
        //g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
        //g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
        //show_graph(g);
        //ij=[13 10;8 6;5 4;4 2];
        //gt=delete_arcs(ij,g);
        //show_graph(gt,'new');
        //g('directed')=0;
        //gt=delete_arcs(ij,g);
        //show_graph(gt,'new');
        //
        // See also
        //   add_edge
        //  add_nod
        //  delete_nodes   
        //
        // Authors
        //   scilab4/metanet/INRIA https://cecill.info/
        //   Philippe ROUX
  
  
  
[lhs,rhs]=argn(0)
if rhs<>2 then error(39), end
// checking ij
if (ij==[]) then g1=g; return end;
if (type(ij)<>1|size(ij,2) <> 2) then
  error('First argument must be a n x 2 scalar vector')
end;
// deleting the edges from nodes i to nodes j
g1=g;ma=prod(size(g('tail')));n=g('node_number');
ta=g('tail');he=g('head');
ic=[];
//
if(g('directed') == 1) then
  for jj=1:size(ij,1),
    i=ij(jj,1);j=ij(jj,2);
    if ((i < 1)|(i > n)) then
      error(string(i)+' is not a node number')
    end;
    if ((j < 1)|(j > n)) then
      error(string(j)+' is not a node number')
    end;
    ic1=find((ta==i)&(he==j));ic=[ic ic1];
  end;
else
  for jj=1:size(ij,1),
    i=ij(jj,1);j=ij(jj,2);
    if ((i < 1)|(i > n)) then
      error(string(i)+' is not a node number')
    end;
    if ((j < 1)|(j > n)) then
      error(string(j)+' is not a node number')
    end;
    ic1=find((ta==i)&(he==j));ic=[ic ic1];
    ic1=find((ta==j)&(he==i));ic=[ic ic1];    
  end;
end;
//
ii=[1:ma];ii(ic)=[];
ta(ic)=[];
if ta==[] then
  error('Cannot delete, a graph must have at least one edge')
end;
g1('tail')=ta;
a=g('head');if a<>[] then g1('head')=a(ii);end
a=g('edge_name');if a<>[] then g1('edge_name')=a(ii);end
a=g('edge_color');if a<>[] then g1('edge_color')=a(ii);end
a=g('edge_width');if a<>[] then g1('edge_width')=a(ii);end
a=g('edge_hi_width');if a<>[] then g1('edge_hi_width')=a(ii);end
a=g('edge_font_size');if a<>[] then g1('edge_font_size')=a(ii);end
a=g('edge_length');if a<>[] then g1('edge_length')=a(ii);end
a=g('edge_cost');if a<>[] then g1('edge_cost')=a(ii);end
a=g('edge_min_cap');if a<>[] then g1('edge_min_cap')=a(ii);end
a=g('edge_max_cap');if a<>[] then g1('edge_max_cap')=a(ii);end
a=g('edge_q_weight');if a<>[] then g1('edge_q_weight')=a(ii);end
a=g('edge_q_orig');if a<>[] then g1('edge_q_orig')=a(ii);end
a=g('edge_weight');if a<>[] then g1('edge_weight')=a(ii);end
a=g('edge_label');if a<>[] then g1('edge_label')=a(ii);end

endfunction
