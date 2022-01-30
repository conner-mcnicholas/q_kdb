/
Given equilateral triangle with a base of "n" indivisible equilateral triangles, write a q program to return the total number of internal triangles (upward pointing only) for any positive integer "n". 

For example,

n = 1 -> 1
n = 2 -> 4
n = 3 -> 10
n = 4 -> 20 (not shown below)

reference -> triangle.png
\

q)tri:{[n] if[n=0;:0] ; counter:n;layer:n; while[layer > 0;counter:counter+layer-1;layer:layer-1]; :counter+tri[n-1]}

/
q)tri[3]
10
q)tri[4]
20
q)tri[1]
1
q)tri[2]
4
q)
q)tri[5]
35
\
