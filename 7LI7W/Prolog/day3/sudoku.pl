% valid if all elements are different
valid([]).
valid([H|T]) :- fd_all_different(H), valid(T).

% slice of list
subsequence(List,Start,0,[]).
subsequence(List,Start,Items,[H|T]) :-
    nth(Start,List,H),
    SN is Start + 1,
    IN is Items - 1,
    subsequence(List,SN,IN,T).

% extracts a row from a linearized square matrix 
row(Pos,Dimension,Matrix,Row) :- 
    Start is ((Pos - 1) * Dimension) + 1,
    length(Row,Dimension),
    Row = [R|Rs],
    SN is Start + 1,
    DN is Dimension - 1,
    subsequence(Matrix,SN,DN,Rs),
    nth(Start,Matrix,R).

% transposes a 2d matrix
transpose2d([[]|_], []).
transpose2d(Matrix, [Row|Rows]) :- 
    transpose2d_1st_col(Matrix, Row, RestMatrix),
    transpose2d(RestMatrix, Rows).

transpose2d_1st_col([], [], []).
transpose2d_1st_col([[H|T]|Rows], [H|Hs], [T|Ts]) :- transpose2d_1st_col(Rows, Hs, Ts).

% transforms a linearized matrix to a 2d data structure
dimensionalize([],_,[]).
dimensionalize(List,Dimension,Matrix) :-
    Matrix = [M|Ms],
    subsequence(List,1,Dimension,M),
    length(List,L),
    Size is L - Dimension,
    Start is Dimension + 1,
    subsequence(List,Start,Size,NewList),
    dimensionalize(NewList, Dimension, Ms).

% etracts a column from a linearized square matrix
col(Pos,Dimension,Matrix,Col) :- 
    dimensionalize(Matrix,Dimension,Matrix2D),
    transpose2d(Matrix2D,Transposed2D),
    flatten(Transposed2D,Transposed),
    row(Pos,Dimension,Transposed,Col).


% 9x9 sudoku
sudoku(Puzzle,Solution) :-
    D is 9,
    Solution = Puzzle,
    fd_domain(Puzzle, 1, D),
    row(1,D,Puzzle,Row1), row(2,D,Puzzle,Row2), row(3,D,Puzzle,Row3), row(4,D,Puzzle,Row4), 
    row(5,D,Puzzle,Row5), row(6,D,Puzzle,Row6), row(7,D,Puzzle,Row7), row(8,D,Puzzle,Row8), row(9,D,Puzzle,Row9), 
    col(1,D,Puzzle,Col1), col(2,D,Puzzle,Col2), col(3,D,Puzzle,Col3), col(4,D,Puzzle,Col4), 
    col(5,D,Puzzle,Col5), col(6,D,Puzzle,Col6), col(7,D,Puzzle,Col7), col(8,D,Puzzle,Col8), col(9,D,Puzzle,Col9), 

    % I really don't care to do squares in the same way I have done columns and rows
    Puzzle = [S11,S12,S13,S14,S15,S16,S17,S18,S19,
              S21,S22,S23,S24,S25,S26,S27,S28,S29,
              S31,S32,S33,S34,S35,S36,S37,S38,S39,
              S41,S42,S43,S44,S45,S46,S47,S48,S49,
              S51,S52,S53,S54,S55,S56,S57,S58,S59,
              S61,S62,S63,S64,S65,S66,S67,S68,S69,
              S71,S72,S73,S74,S75,S76,S77,S78,S79,
              S81,S82,S83,S84,S85,S86,S87,S88,S89,
              S91,S92,S93,S94,S95,S96,S97,S98,S99],
              
    Sqr1 = [S11,S12,S13,S21,S22,S23,S31,S32,S33],
    Sqr2 = [S14,S15,S16,S24,S25,S26,S34,S35,S36],
    Sqr3 = [S17,S18,S19,S27,S28,S29,S37,S38,S39],
    Sqr4 = [S41,S42,S43,S51,S52,S53,S61,S62,S63],
    Sqr5 = [S44,S45,S46,S54,S55,S56,S64,S65,S66],
    Sqr6 = [S47,S48,S49,S57,S58,S59,S67,S68,S69],
    Sqr7 = [S71,S72,S73,S81,S82,S83,S91,S92,S93],
    Sqr8 = [S74,S75,S76,S84,S85,S86,S94,S95,S96],
    Sqr9 = [S77,S78,S79,S87,S88,S89,S97,S98,S99],

    valid([Row1,Row2,Row3,Row4,Row5,Row6,Row7,Row8,Row9,
           Col1,Col2,Col3,Col4,Col5,Col6,Col7,Col8,Col9,
           Sqr1,Sqr2,Sqr3,Sqr4,Sqr5,Sqr6,Sqr7,Sqr8,Sqr9]).

            





