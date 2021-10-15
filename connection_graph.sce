liste_fonctions=ls('*.sci')';
n=prod(size(liste_fonctions));
M=spzeros(n,n);
for n1=1:n
    fun1=liste_fonctions(n1);
    disp(fun1)
    fun1=part(fun1,1:strindex(fun1,'.sci')-1);
    liste_fonctions(n1)=fun1;
    disp(fun1)
    execstr('tmp=macrovar('+fun1+')');
    liste_appels=tmp(4)';
    for fun2=liste_appels
        n2=find(liste_fonctions==fun2);
        if n2<>[] then printf('%s --> %s\n',fun1,fun2)
        end
        M(n1,n2)=1;
    end
end
// création du graph
t=1:n;
D=200;
x=D*cos(t);
y=D*sin(t);
G=mat_2_graph(M,1,'node-node');
G.node_x=x;
G.node_y=y;
G.node_name=liste_fonctions;
show_graph(G)
