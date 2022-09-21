% Recognizes 10101 or ends with 0010 but not both.

start([0|X]) :- foundZero(X).
start([1|X]) :- foundOne(X).
foundOne([0|X]) :- foundOneZero(X).
foundOne([1|X]) :- foundOne(X).
foundOneZero([0|X]) :- foundZeroZero(X).
foundOneZero([1|X]) :- foundOneZeroOne(X).
foundOneZeroOne([0|X]) :- foundOneZeroOneZero(X).
foundOneZeroOne([1|X]) :- foundOne(X).
foundOneZeroOneZero([0|X]) :- foundZeroZero(X).
foundOneZeroOneZero([1|X]) :- condOne(X).

foundZero([0|X]) :- foundZeroZero(X).
foundZero([1|X]) :- foundOne(X).
foundZeroZero([0|X]) :- foundZeroZero(X).
foundZeroZero([1|X]) :- foundZeroZeroOne(X).
foundZeroZeroOne([0|X]) :- cond2(X).
foundZeroZeroOne([1|X]) :- foundOne(X).

condOne([0|X]) :- badZero(X).
condOne([1|X]) :- condOne(X).
condOne([]).
cond2([0|X]) :- foundZeroZero(X).
cond2([1|X]) :- foundOneZeroOne(X).
cond2([]).

badZero([0|X]) :- badZeroZero(X).
badZero([1|X]) :- condOne(X).
badZero([]).

badZeroZero([0|X]) :- badZeroZero(X).
badZeroZero([1|X]) :- badZeroZeroOne(X).
badZeroZero([]).

badZeroZeroOne([0|X]) :- badCondTwo(X).
badZeroZeroOne([1|X]) :- condOne(X).
badZeroZeroOne([]).

badCondTwo([0|X]) :- badZeroZero(X).
badCondTwo([1|X]) :- condOne(X).