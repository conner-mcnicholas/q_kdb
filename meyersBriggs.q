persCombos:([]energy:`E`I)cross([]thinking:`S`N)cross([]values:`T`F)cross([]life:`J`P)

persPercents:([]e:.49 .51)cross([]t:.73 .27)cross([]v:.4 .6)cross([]l:.54 .46)

persTab:persCombos,'persPercents

persBreakdown:`dist xdesc update dist:e*t*v*l*100 from persTab

/
q)persBreakdown
energy thinking values life e    t    v   l    dist
-------------------------------------------------------
I      S        F      J    0.51 0.73 0.6 0.54 12.06252
E      S        F      J    0.49 0.73 0.6 0.54 11.58948
I      S        F      P    0.51 0.73 0.6 0.46 10.27548
E      S        F      P    0.49 0.73 0.6 0.46 9.87252
I      S        T      J    0.51 0.73 0.4 0.54 8.04168
E      S        T      J    0.49 0.73 0.4 0.54 7.72632
I      S        T      P    0.51 0.73 0.4 0.46 6.85032
E      S        T      P    0.49 0.73 0.4 0.46 6.58168
I      N        F      J    0.51 0.27 0.6 0.54 4.46148
E      N        F      J    0.49 0.27 0.6 0.54 4.28652
I      N        F      P    0.51 0.27 0.6 0.46 3.80052
E      N        F      P    0.49 0.27 0.6 0.46 3.65148
I      N        T      J    0.51 0.27 0.4 0.54 2.97432
E      N        T      J    0.49 0.27 0.4 0.54 2.85768
I      N        T      P    0.51 0.27 0.4 0.46 2.53368
E      N        T      P    0.49 0.27 0.4 0.46 2.43432
\
