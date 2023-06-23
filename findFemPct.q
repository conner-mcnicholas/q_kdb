fp:{[P;Pm;Prm;Prf]
    -1"Learning Overall Republican Support Repeal of Roe v. Wade = ",(string 100*P),"%"; -1"";
    -1"if we know..."; -1"Republican Party is Comprised By: ";
    -1(string 100*Prm),"% of All Men";
    -1(string 100*Prf),"% of All Women";
    -1""; -1"and we assume..."; -1"Male Republican Support Repeal of Roe v. Wade = ",(string 100*Pm),"% ...";
    Pr:Prm+Prf;
    Pf:((P*Pr)-(Pm*Prm))%Prf;
    -1""; -1"then we find..."; -1""; -1(string 100*Pf),"% of Republican Women Support Repealing Roe v. Wade"}

fpa:{[A;B;C;D]((A*(D+C))-(B*C))%D}

/
fpa[.8;.85;.53;.38]
0.73
\
fp[.8;.85;.53;.38]
/
Learning Overall Republican Support Repeal of Roe v. Wade = 80%

if we know...
Republican Party is Comprised By:
53% of All Men
38% of All Women

and we assume...
Male Republican Support Repeal of Roe v. Wade = 85% ...

then we find...

73% of Republican Women Support Repealing Roe v. Wade
\
fp[.8;.99;.53;.38]
/
Learning Overall Republican Support Repeal of Roe v. Wade = 80%

if we know...
Republican Party is Comprised By:
53% of All Men
38% of All Women

and we assume...
Male Republican Support Repeal of Roe v. Wade = 99% ...

then we find...

53.5% of Republican Women Support Repealing Roe v. Wade
\
\\
