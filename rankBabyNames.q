system "cd names"

nby:(,/){update year:"I"$4#3_string x from flip (`name`sex`counter)!("SSI";",") 0: hsym x} each `$system "ls"

system "cd .."

yrDict:yrs!{`counter xdesc select from nby where year  = x} each yrs:desc distinct nby`year

ctrD:raze {(enlist x)!enlist (1+til count distinct (yrDict x)`counter)!distinct (yrDict x)`counter} each yrs

yearlyRank:raze {update rnk:ctrD[x]?counter from yrDict x} each yrs

"usage: select from yearlyRank where year = <choose year>"
"note: sex is not considered in the ranking"
"sample results for 2020:"
\c 10 300
show select from yearlyRank where year = 2020

/
name      sex counter year rnk
------------------------------
Liam      M   19659   2020 1  
Noah      M   18252   2020 2  
Olivia    F   17535   2020 3  
Emma      F   15581   2020 4  
Oliver    M   14147   2020 5  
Ava       F   13084   2020 6  
Elijah    M   13034   2020 7  
Charlotte F   13003   2020 8  
Sophia    F   12976   2020 9  
Amelia    F   12704   2020 10 
William   M   12541   2020 11 
James     M   12250   2020 12 
Benjamin  M   12136   2020 13 
Isabella  F   12066   2020 14 
Lucas     M   11281   2020 15 
Mia       F   11157   2020 16 
Henry     M   10705   2020 17 
Alexander M   10151   2020 18 
Mason     M   10029   2020 19 
Michael   M   9717    2020 20 
 
\