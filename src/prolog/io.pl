% predicates for writing .pl file
%     open('polygons.pl', write, Out),
write_polygons(Polygons, File, N):-
    Polygons == [] ->
	write(File, "\n");
    (Polygons = [H | T],
     write(File, "polygon(pol_"),
     write(File, N),
     write(File, ","),
     write_list(File, H),
     write(File, ").\n"),
     N2 is N + 1,
     write_polygons(T, File, N2)
    ).

write_list(File, L):-
    L == [] ->
	write(File, "\n");
    (write(File, "["),
     L = [H | T],
     write_term(File, H, [max_depth(0)]),
     forall(member(X, T),
	    (write(File, ","),
	     write_term(File, X, [max_depth(0)])
	    )
	   ),
     write(File, "]")
    ).
