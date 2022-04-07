\c 10 3000

system "cd names"

nby:(,/){update year:"I"$4#3_string x from flip (`name`sex`counter)!("SSI";",") 0: hsym x} each `$system "ls"
nbym:select from nby where sex = `M
nbyf:select from nby where sex = `F

system "cd .."

yrDict:yrs!{`counter xdesc select from nbym where year  = x} each yrs:desc distinct nbym`year

ctrD:raze {(enlist x)!enlist (1+til count (yrDict x)`counter)!(yrDict x)`counter} each yrs

yearlyRank:raze {update rnk:ctrD[x]?counter from yrDict x} each yrs

1 "\n\nusage: select from yearlyRank where year = <choose year>\nnote: sex is not considered in the ranking\nsample results for 2020:\n\n";

show select from yearlyRank where year = 2020

update totalNames:count distinct name by year from `yearlyRank;
update pctile:100*rnk%totalNames from `yearlyRank;
james:`year`jameses`pctile`ranking xcols `year`jameses`ranking`pctile xcol `year`counter`rnk`pctile xcols delete name,sex,totalNames from select from yearlyRank where name = `James,sex=`M

1 "\n\ntaking a peek at the trend of Jamessss...\n\n" ;

show james

save `:james.csv;

/
name      sex counter year rnk
------------------------------
Liam      M   19659   2020 1
Noah      M   18252   2020 2
Olivia    F   17535   2020 3
Emma      F   15581   2020 4
Oliver    M   14147   2020 5
\
