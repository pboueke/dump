queen((Row,Col)) :- 
    Range = [1,2,3,4,5,6,7,8],
    member(Row, Range), member(Col, Range).

eight_queens((RA,CA),(RB,CB),(RC,CC),(RD,CD),(RE,CE),(RF,CF),(RG,CG),(RH,CH)) :-
    queen((RA,CA)), queen((RB,CB)), queen((RC,CC)), queen((RD,CD)),
    queen((RE,CE)), queen((RF,CF)), queen((RG,CG)), queen((RH,CH)),
    fd_all_different([RA,RB,RC,RD,RE,RF,RG,RH]), fd_all_different([CA,CB,CC,CD,CE,CF,CG,CH]),
    D1A is CA + RA, D2A is CA - RA, D1B is CB + RB, D2B is CB - RB, D1C is CC + RC, D2C is CC - RC, D1D is CD + RD, D2D is CD - RD,
    D1E is CE + RE, D2E is CE - RE, D1F is CF + RF, D2F is CF - RF, D1G is CG + RG, D2G is CG - RG, D1H is CH + RH, D2H is CH - RH,
    fd_all_different([D1A,D1B,D1C,D1D,D1E,D1F,D1G,D1H]), fd_all_different([D2A,D2B,D2C,D2D,D2E,D2F,D2G,D2H]).

