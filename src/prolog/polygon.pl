% polygon matcher

% polygon definition (with vertex list)
polygon_chk_v(V):-
    length(V, Len),
    Len == 1,
    !.
    
polygon_chk_v(V):-
    length(V, Len),
    Len > 1,
    V = [V1, V2 | Vs],
    V1 \= V2,
    recursion_limit(N),
    edge_line_seg(V1, V2, N),
    VV = [V2 | Vs],
    polygon_chk_v(VV).

polygon_chk_xy(V):-
    length(V, Len),
    Len == 1,
    !.
    
polygon_chk_xy(V):-
    length(V, Len),
    Len > 1,
    V = [V1, V2 | Vs],
    V1 = [X1, Y1],
    V2 = [X2, Y2],
    recursion_limit(N),
    edge_line_seg(X1, Y1, X2, Y2, N),
    VV = [V2 | Vs],
    polygon_chk_xy(VV).

% edge quantity of polygon
edge_numbers(Polygon, N):-
    polygon(Polygon, Edge_list),
    !,
    length(Edge_list, N).

edge_numbers(Polygon, N):-
    length(Polygon, N).

% triangle (vertex)
triangle_chk_v(P1, P2, P3):-
    polygon_chk_v([P1, P2, P3, P1]).

triangle_chk_v_display(P1, P2, P3):-
    display_refresh,
    display_point(P1, r),
    display_point(P2, r),
    display_point(P3, r),
    polygon_chk_v([P1, P2, P3, P1]).
