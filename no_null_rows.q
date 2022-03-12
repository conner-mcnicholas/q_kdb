tab:([] col1:`a`b`c`d;col2:1 0N 3 0N;col3:"v vv";col4:0n 1.0 2.0 3.0;col5:("";"";"rf";"er"))

nonull:?[`tab;not,'enlist each @[(null;0=count');"C"=exec t from meta tab],'cols tab;0b;()]

/
q)tab
col1 col2 col3 col4 col5
------------------------
a    1    v         ""
b              1    ""
c    3    v    2    "rf"
d         v    3    "er"

q)nonull
col1 col2 col3 col4 col5
------------------------
c    3    v    2    "rf"
\

