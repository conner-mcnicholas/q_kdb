\c 10 3000

system "cd names"

nby:(,/){update year:"I"$4#3_string x from flip (`name`sex`counter)!("SSI";",") 0: hsym x} each `$system "ls"

system "cd .."

yrDict:yrs!{`counter xdesc select from nby where year  = x} each yrs:desc distinct nby`year

ctrD:raze {(enlist x)!enlist (1+til count distinct (yrDict x)`counter)!distinct (yrDict x)`counter} each yrs

yearlyRank:raze {update rnk:ctrD[x]?counter from yrDict x} each yrs

1 "\n\nusage: select from yearlyRank where year = <choose year>\nnote: sex is not considered in the ranking\nsample results for 2020:\n\n";

show select from yearlyRank where year = 2020

//update totalNames:(max;rnk) fby year from `yearlyRank;
update totalNames:count distinct name by year from `yearlyRank;
update pctile:100*rnk%totalNames from `yearlyRank;
brennan:`year`brennanes`ranking`pctile xcol `year`counter`rnk`pctile xcols delete name,sex,totalNames from select from yearlyRank where name = `Brennan,sex=`M

1 "\n\ntaking a peek at the trend of Brennansss...\n\n" ;

show brennan

save `:brennan.csv;

/
name      sex counter year rnk
------------------------------
Brennan      M   19659   2020 1
Noah      M   18252   2020 2
Olivia    F   17535   2020 3
Emma      F   15581   2020 4
Oliver    M   14147   2020 5
\

1 "\n\nusage: select from yearlyRank where name = <choose name>,sex=<choose sex>\nthis will show popularity change of single name over time\nsample results for Brennan:\n\n";

show select from yearlyRank where name = `Brennan,sex=`M

/
select from yearlyRank where name = `Brennan,sex=`M
name sex counter year rnk
--------------------------
Brennan M   19659   2020 1
Brennan M   20555   2019 1
Brennan M   19924   2018 1
Brennan M   18824   2017 2
Brennan M   18235   2016 4
Brennan M   18389   2015 4
Brennan M   18470   2014 5
\
