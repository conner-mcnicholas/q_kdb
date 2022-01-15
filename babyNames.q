//must be in directory with the text files for the 'ls' call to work properly, otherwise need to define whole path
//nby stands for "names by year", as there are other breakdowns released by the department

nby:(,/){update year:x from flip (`name`sex`counter)!("*SI";",") 0: hsym x} each `$1_system"ls "

update year:string year from `nby

update year:`$3_'(7#'year) from `nby

update annualBabies:sum counter,annualNames:count name by year from `nby

connerNames:select from nby where name like "Conner",sex = `M

connorNames:select from nby where name like "Connor",sex = `M

conorNames:select from nby where name like "Conor",sex = `M

conerNames:select from nby where name like "Coner",sex = `M

connerNamesF:select from nby where name like "Conner",sex = `F

connorNamesF:select from nby where name like "Connor",sex = `F

conorNamesF:select from nby where name like "Conor",sex = `F

conerNamesF:select from nby where name like "Coner",sex = `F

connerCount:exec sum counter from nby where name like "Conner",sex=`M
connorCount:exec sum counter from nby where name like "Connor",sex=`M
conorCount:exec sum counter from nby where name like "Conor",sex=`M
conerCount:exec sum counter from nby where name like "Coner",sex=`M

/
q)connerCount
50901i
q)connorCount
197630i
q)conorCount
21457i
q)conerCount
114i
\

allCons:(+/)(connerCount;connorCount;conorCount;conerCount)

/
q)allCons
270102i
q)connerCount%allCons
0.188451
q)100*connerCount%allCons
18.8451

q)select from nby where name like "Conner",counter = (max;counter) fby name
name     sex counter year annualBabies annualNames
--------------------------------------------------
"Conner" M   3205    2005 3841440      32543

q)`totalCount xdesc select totalCount:sum counter by name from nby
name         | totalCount
-------------| ----------
"James"      | 5159306   
"John"       | 5127501   
"Robert"     | 4829274   
"Michael"    | 4359820   
"Mary"       | 4135851   
"William"    | 4103456   
"David"      | 3613916   
"Joseph"     | 2603475   
"Richard"    | 2570304   
"Charles"    | 2391199   
"Thomas"     | 2306216   
"Christopher"| 2023318   
"Daniel"     | 1903647   
"Elizabeth"  | 1625783   
"Matthew"    | 1584209   
"Patricia"   | 1576343   
"George"     | 1470933   
"Jennifer"   | 1470081   
"Linda"      | 1455566   
"Barbara"    | 1437865   
"Anthony"    | 1430880   
"Donald"     | 1415938   
"Paul"       | 1390956   
"Mark"       | 1352418   
"Edward"     | 1291786   
"Steven"     | 1282770   
"Andrew"     | 1280459   
"Kenneth"    | 1276188   
"Margaret"   | 1248131   
"Joshua"     | 1198955   
"Kevin"      | 1168242   
"Brian"      | 1166766   
"Susan"      | 1123687   


\


