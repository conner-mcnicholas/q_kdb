//creates a list x long with percentage y of 1s.
pctl:{one:((("i"$x*(y%100))#1));(neg x)?one,((x-count one)#0)}

//list of 100 1s and 0s with exactly 50% randomly scattered 1s.
l:pctl[10000000;50]

//most pleasing to look at
simple:{({y*x+y}\)x}

//best performing
fast:{x*(,/)((+\)')(0,where x & differ x)_x} 

\ts simple l
\ts fast l
