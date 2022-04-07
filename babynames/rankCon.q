\c 10 3000

system "cd names"

nby:(,/){update year:"J"$4#3_string x from flip (`name`sex`counter)!("SSI";",") 0: hsym x} each `$system "ls"

concnt:([]name:`ConNEOr;sex:`M;counter:0N;year:1880 + til 141)
{update counter:(sum exec counter from nby where name in `Conner`Connor`Conor,sex=`M,year = x) from `concnt where year = x} each concnt`year
nby:`year`sex`counter`name xasc (delete from nby where name in `Conner`Connor`Conor),concnt

system "cd .."

yrDict:yrs!{`counter xdesc select from nby where year  = x} each yrs:desc distinct nby`year

ctrD:raze {(enlist x)!enlist (1+til count distinct (yrDict x)`counter)!distinct (yrDict x)`counter} each yrs

yearlyRank:raze {update rnk:ctrD[x]?counter from yrDict x} each yrs

1 "\n\nusage: select from yearlyRank where year = <choose year>\nnote: sex is not considered in the ranking\nsample results for 2020:\n\n";

show select from yearlyRank where year = 2020

update totalNames:(max;rnk) fby year from `yearlyRank;
update pctile:100*rnk%totalNames from `yearlyRank;
conner:`year`conNEOrs`ranking`pctile xcol `year`counter`rnk`pctile xcols delete name,sex,totalNames from select from yearlyRank where name = `ConNEOr,sex=`M

1 "\n\ntaking a peek at the trend of Conner or Connor or Conor (aggregating and ranking as one name)...\n\n" ;

show conner

save `:conner.csv;

/
name      sex counter year rnk
------------------------------
Liam      M   19659   2020 1
Noah      M   18252   2020 2
Olivia    F   17535   2020 3
Emma      F   15581   2020 4
Oliver    M   14147   2020 5
\

1 "\n\nusage: select from yearlyRank where name = <choose name>,sex=<choose sex>\nthis will show popularity change of single name over time\nsample results for Liam:\n\n";

show select from yearlyRank where name = `Liam,sex=`M

/
select from yearlyRank where name = `Liam,sex=`M
name sex counter year rnk
--------------------------
Liam M   19659   2020 1
Liam M   20555   2019 1
Liam M   19924   2018 1
Liam M   18824   2017 2
Liam M   18235   2016 4
Liam M   18389   2015 4
Liam M   18470   2014 5
\
