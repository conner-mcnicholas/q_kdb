nby:(,/){update year:x from flip (`name`sex`counter)!("*SI";",") 0: hsym x} each `$1_system"ls "

conyrcount:0!`year`counter xasc select sum counter by name,year from nby where name in ("Conner";"Conor";"Connor";"Coner")

conner:`year`conner  xcol delete name from select from conyrcount where name like "Conner"
connor:`year`connor  xcol delete name from select from conyrcount where name like "Connor"
coner:`year`coner  xcol delete name from select from conyrcount where name like "Coner"
conor:`year`conor  xcol delete name from select from conyrcount where name like "Conor"

con:1!([]year:1912 + 1+til (2020-1912);coner:0Ni;conor:0Ni;conner:0Ni;connor:0Ni)

compareCon:0 ^ con lj (1!connor) lj (1!conner) lj (1!conor) lj (1!coner)

save `:compareCon.csv