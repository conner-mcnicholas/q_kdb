//creates a list x long with percentage y of 1s.
pctl:{one:((("i"$x*(y%100))#1));(neg x)?one,((x-count one)#0)}

//list of 100 1s and 0s with exactly 50% randomly scattered 1s.
l:pctl[10000000;50]

//cuts the list at each 1 after a 0, sums each streak and then razes. using vector conditional to reset 0s.
streak:{?["b"$x;(,/)((+\)')({0,where (1 = x) & 0 = prev x}x)_x;0]}

//this is a bit simpler to understand, but for very long lists it is slower. the conditional execution is less efficient?
streak2:{({$[y=0;0;x+y]}\)x}

//tallies the streaks of the list l
srk:streak l

//tabulates list with streak tally and index
tabl:([]ind:til count l;l;srk)

-1 "Flipping a coin a million times will yield a streak of ~20 heads/tails in a row"

show select max srk by ("i"$.1*count tabl) xbar ind from tabl

/

ind    | srk
-------| ---
0      | 18 
1000000| 18 
2000000| 23 
3000000| 20 
4000000| 20 
5000000| 20 
6000000| 22 
7000000| 21 
8000000| 18 
9000000| 18 
