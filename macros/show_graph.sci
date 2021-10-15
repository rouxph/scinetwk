function show_graph(G)
    //  SciNetwk 
    // 
    // Syntax
    // show_graph(G)
    //
    // Parameters
    // G: is a mlist (type is "graph") with 31 data fields
    //
    // Description
    // plot a graph G using nodes/edges information from graph structure
    //
    // Examples
    //    ta=[1 1 2 2 2 3 4 5 5 7 8 8 9 10 10 10 11 12 13 13 13 14 15 16 16 17 17 9];
    //    he=[2 10 3 5 7 4 2 4 6 8 6 9 7 7 11 15 12 13 9 10 14 11 16 1 17 14 15 9];
    //    g=make_graph('foo',1,17,ta,he);
    //    g('node_x')=[283 163 63 57 164 164 273 271 339 384 504 513 439 623 631 757 642];
    //    g('node_y')=[59 133 223 318 227 319 221 324 432 141 209 319 428 443 187 151 301];
    //    g.node_color=2+pmodulo(1:17,5)
    //    g.node_diam(:)=40;
    //    g.edge_label="$e_{"+string(1:length(ta))+"}$"
    //    g.edge_font_size(:)=2;
    //    show_graph(g)

    //
    // See also
    //  graph_fields
    //
    // Authors
    //  Philippe Roux
    //
    
    n=G.node_number
    m=length(G.tail)
    clf()    
    drawlater
    //draw edges
    theta=[0:%pi/40:2*%pi]
    x_mid=zeros(1:m)
    y_mid=zeros(1:m)
    dx=zeros(1:m)
    dy=zeros(1:m)
    for k=1:m
        a=G.head(k)
        b=G.tail(k)
        edge=[a;b]
        if a<>b then 
            plot(G.node_x(edge),G.node_y(edge))
        gce().children.foreground=G.edge_color(k)
        gce().children.thickness=G.edge_width(k)
            x_mid(k)=(G.node_x(a)+G.node_x(b))/2
            y_mid(k)=(G.node_y(a)+G.node_y(b))/2
            dx(k)=-(G.node_x(b)-G.node_x(a))/10
            dy(k)=-(G.node_y(b)-G.node_y(a))/10
        else //loop
            dx(k)=G.node_diam(a)
            dy(k)=G.node_diam(a)
            x_mid(k)=G.node_x(a)+dy(k)*0.83
            y_mid(k)=G.node_y(a)-dx(k)*0.83
            dx(k)=dx(k)/10
            dy(k)=dy(k)/10
            xarc(G.node_x(a),G.node_y(a),G.node_diam(a),G.node_diam(a),0,360*64)
            gce().background = 1// black color
        end
        //arrows if directed
        if G.directed then
            xarrows([x_mid(k),x_mid(k)+dx(k)],[y_mid(k),y_mid(k)+dy(k)],G.default_node_diam*10)
            gce().thickness=G.edge_width(k)
            xstring(x_mid(k),y_mid(k),G.edge_label(k))
            gce().font_size=G.edge_font_size(k)
        end
        
    end
    // draw nodes
    for k=1:n
        xfarc(G.node_x(k)-G.node_diam(k)/2,G.node_y(k)+G.node_diam(k)/2,G.node_diam(k),G.node_diam(k),0,360*64)
        gce().background = G.node_color(k)
        xarc(G.node_x(k)-G.node_diam(k)/2,G.node_y(k)+G.node_diam(k)/2,G.node_diam(k),G.node_diam(k),0,360*64)
        gce().background = 1// black color
        xstring(G.node_x(k)-G.node_diam(k)/4,G.node_y(k)-G.node_diam(k)/3,G.node_label(k))
        gce().font_size=G.node_font_size(k)
    end
    //resize window
    Mx=max(G.node_x)
    mx=min(G.node_x)
    My=max(G.node_y)
    my=min(G.node_y)
    dx=(Mx-mx)/20
    dy=(My-my)/20
    rect=[mx-dx,my-dy;Mx+dx,My+dy]
    gca().data_bounds=rect
    //final
    gca().box="off"
    gca().axes_visible(:)="off"
    drawnow
endfunction
