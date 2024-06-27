\c 10 3000

system "cd names"
cmdarg:(.Q.opt .z.x)`name`sex
aname:first cmdarg 0
asex:`$first cmdarg 1

nby:(,/){update year:"J"$4#3_string x from flip (`name`sex`counter)!("SSJ";",") 0: hsym x} each `$system "ls"
nby:select from nby where sex = asex

system "cd .."

yrDict:yrs!{`counter xdesc select from nby where year  = x} each yrs:desc distinct nby`year

ctrD:raze {(enlist x)!enlist (1+til count (yrDict x)`counter)!(yrDict x)`counter} each yrs

yearlyRank:raze {update rnk:ctrD[x]?counter from yrDict x} each yrs

1 "\n\nusage: select from yearlyRank where year = <choose year>\nnote: sex is not considered in the ranking\nsample results for 2020:\n\n";

show select from yearlyRank where year = 2020

//update totalNames:(max;rnk) fby year from `yearlyRank;
update totalNames:count distinct name by year from `yearlyRank;
update pctile:100*rnk%totalNames from `yearlyRank;



nametab:(`year,(`$aname),`pctile`ranking) xcols (`year,(`$aname),`ranking`pctile) xcol `year`counter`rnk`pctile xcols delete name,sex,totalNames from select from yearlyRank where name = `$aname

1 "\n\ntaking a peek at the trend...\n\n" ;

show nametab
(hsym `$aname,("_",(string asex)),".csv") 0: csv 0: nametab

