include "alldifferent.mzn";

var 1..9: C;
var 0..9: A;
var 0..9: O;
var 1..9: Z;
var 0..9: H;
var 0..9: I;
var 1..9: P;
var 1..9: T;
var 0..9: E;
var 0..9: S;

constraint
            C*100 + A*10 + O
          + Z*100 + H*10 + I
          + C*100 + A*10 + O
          +         P*10 + I
      == T*1000 + E*100 + S*10 + T;
      
constraint alldifferent([C,A,O,Z,H,I,P,T,E,S]);

constraint P == 3 * Z;
constraint O == 0;

solve satisfy;
