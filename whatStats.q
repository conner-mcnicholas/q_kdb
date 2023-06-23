/#####################################################
/##########Whatsapp analytics script##################
/#			  Author:Angus Wilson				     #
/#####################################################
/# Open a whatsapp convo, click : in top right.	     #
/# more > email chat. Send without media to yourself #
/# drop the file in q directory next to this script  #
/# edit chat name below, and run script.			 #
/#													 #
/#####################################################
/#													 #
/#	chatTable is the variable with full parsed log	 #
/#													 #
/#	use qStudio to plot tables to see volumes etc	 #
/#													 #
/#####################################################
\c 60 3000
\P 3
//load in the chat 	######INSERT CHAT NAME HERE###############
chat:1_read0 `$":","brotherschat.txt" 
/#############################################################

//###Parse the file###
//handling newlines in messages - joining them up
msgStart:{all "/"~/:x[2 5]} each chat
newlines : not msgStart
wrapMessages:-1+a where 1<>deltas a:where not {all "/"~/:x[2 5]} each chat
longMsgs:(where 1<>deltas a) cut a
joinedLongMsgs:" " sv/: chat wrapMessages,'longMsgs
{@[`chat;x;:;y]} ./: wrapMessages,'enlist each joinedLongMsgs
chat:chat (til count chat) except raze longMsgs

/parse timestamps
time:last each trim each tSplit:"," vs/: first each split:"-" vs/: chat
date:"D"$"." sv/: "/" vs/: first each tSplit

/handle 12hr clock
twelves:"12"~/:time[;0 1]
pms:"PM"~/:-2#/:time
time:@["T"$first each " " vs/: time;where pms and not twelves;+;12*60*60*1000]

/rsplit:split where ":" in/: split[;1]

/get the person and message
person:`$1_/:first each ":" vs/: split[;1]
message:1_/:raze each 1_/:":" vs/: raze each 1_/:split

/create table
chatTable:([]date:date;time:time;person:person;message:message)

/handle whatsapp internal messages
badmsg: ("*created group*";"*Disappearing messages now support keeping messages*";"*started a video call*";"*started a call*";"*updated the message timer*";"*changed the subject*";"*changed this group's icon*";"were added";"* removed *";"* left *")
{chatTable::select from chatTable where not person like badmsg x} each til count badmsg

/###################
/###Data analysis###
/###################
/sent message percentages
msgRatio:select percentage:100*(count i)%count chatTable by person from chatTable

/daily volume of messages - plot for time series graph
dailyVol:select vol:count i by date from chatTable

/Average message volume through the day - plot for daily volume profiles
dailyAvgMsgVol:select vol:count i by 60 xbar time.minute from chatTable
/smoothDaily:select minute,20 mavg vol from ([]minute:00:01*til 60*24) lj select vol:count i by 5 xbar time.minute from chatTable
smoothdailyfunc:{([]minute:"u"$x*til "i"$(60%x)*24) lj select vol:count i by x xbar time.minute from chatTable}
smoothdaily:smoothdailyfunc 30

/Average message length per person
avgMsgLength:select length:avg count each message by person from chatTable

/max message length per person
maxMsgLength:select length:max count each message by person from chatTable

/adding in day of week
dayVol:select percentage:100*(count i)%count chatTable by day from update day:`Saturday`Sunday`Monday`Tuesday`Wednesday`Thursday`Friday date mod 7 from chatTable
dayVol:1!(0!dayVol) 1 5 6 4 0 2 3



//#### Print out key stats
show "Distribution of message volume by brothah"
show msgRatio
show "-----------------------------------------"

show "Average message length per brothah"
show avgMsgLength
show "-----------------------------------------"

show "Max message length per brothah"
show maxMsgLength
show "-----------------------------------------"

show "Total message volume grouped by the 1/2 Hour"
show smoothdaily
show "-----------------------------------------"

show "Top 10 Dates By Message Volume"
show 10#`vol xdesc dailyVol
show "-----------------------------------------"

show "Lowest 10 Dates By Message Volume"
show 10#`vol xasc dailyVol

/

Distribution of message volume by brothah:
person         | percentage
---------------| ----------
Conner         | 19.6      
James          | 55.3      
Liam McNicholas| 25.2      

Average message length per brothah:
person         | length
---------------| ------
Conner         | 54.1  
James          | 41    
Liam McNicholas| 42.6  

Max message length per brothah:
person         | length
---------------| ------
Conner         | 2366  
James          | 814   
Liam McNicholas| 338   

Total message volume grouped by the 1/2 Hour:
minute vol
----------
00:00     
00:30     
01:00  1  
01:30     
02:00     
02:30     
03:00  1  
03:30     
04:00     
04:30  3  
05:00  2  
05:30     
06:00  4  
06:30  5  
07:00  23 
07:30  42 
08:00  77 
08:30  80 
09:00  144
09:30  162
10:00  202
10:30  121
11:00  151
11:30  137
12:00  153
12:30  168
13:00  150
13:30  182
14:00  218
14:30  188
15:00  224
15:30  292
16:00  238
16:30  281
17:00  423
17:30  308
18:00  304
18:30  397
19:00  391
19:30  392
20:00  361
20:30  321
21:00  421
21:30  332
22:00  389
22:30  241
23:00  113
23:30  33 

Top 10 Dates By Message Volume:
date      | vol
----------| ---
2021.11.21| 176
2021.02.05| 149
2021.11.19| 136
2021.03.18| 128
2021.01.06| 125
2021.11.04| 113
2020.12.09| 112
2021.02.04| 109
2021.01.22| 106
2021.06.11| 96 

Lowest 10 Dates By Message Volume:
date      | vol
----------| ---
2021.02.10| 1  
2021.02.11| 1  
2021.04.13| 1  
2021.05.25| 1  
2021.05.31| 1  
2021.06.01| 1  
2021.06.17| 1  
2021.07.02| 1  
2021.07.26| 1  
2021.07.31| 1