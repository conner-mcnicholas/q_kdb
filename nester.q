nestr:{((count')c)!c:((count')') (raze\) x}

l:((((3 6 5 4);((6 5);9 7 5 4 3);(6 7 4));((3 6 5 4);((9 7 5 4 3);(6 7 4))));(9;8))

P:flip{(group x)x}each P,enlist 3 sv floor(P:raze each flip scan 9#'til 9)%3

-1 "see as we illuminate messy nested lists... ";

-1 "nestr -> ", string nestr;

-1 "complicated nested list l ";

-1 "again with list P";

-1 "razing thorough l and then P using scan";

(raze\)l

-1 "now P ";

(raze\)P

-1 "applying nestr to l and P clarify their messy structure";

nestr l

-1 "finally P ";

nestr P

