\P 4
system "cd names"
nby:(,/){update year:"J"$4#3_string x from flip (`name`sex`counter)!("SSJ";",") 0: hsym x} each `$system "ls"
system "cd .."
yD:yrs!{`counter xdesc select from nby where year = x} each yrs:desc distinct nby`year
cD:raze {(enlist x)!enlist (1+til count (yD x)`counter)!(yD x)`counter} each yrs
yearlyRank:raze {update rnk:cD[x]?counter from yD x} each yrs
update totalNames:count distinct name by year from `yearlyRank
update pctile:100*rnk%totalNames from `yearlyRank
alex:`YEAR`ALEXS`PCTILE`RANK xcol `year`counter`pctile`rnk xcols delete name,sex,totalNames from select from yearlyRank where name = `Alex
show alex
