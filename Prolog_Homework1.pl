/* Alexandra Burke
 * Prolog_Homework1.pl
 * SUBMISSION DATE HERE
 * In this file there are three independent Knowledge Bases.
 * Your task is to determine:
 * a) What each Knowledge Base is looking for
 * b) Is the Knowledge Base correct (i.e. will it always return the right answer for every query). 
 *    A wrong answer could be returned from several different results. 
 *     1) Missing statements or rules
 *     2) Improper statements or rules 
 *     3) Poor end conditions
 *    If there are errors inside the Knowledge Bases, what steps are needed to fix them? 
 *    i.e. what changes or new rules would be added in?
 * c) What are two (valid) queries that will return True from each Knowledge Base, and what are two 
 *    queries that will return False from each. */


% KNOWLEDGE BASE 1 –– correct
delta(1, []).
delta(1,[a | X]) :- delta(1, X).
delta(1,[b | X]) :- delta(2, X).
delta(1,[c | X]) :- delta(1, X).
delta(2, []).
delta(2,[a | X]) :- delta(2, X).
delta(2,[b | X]) :- delta(3, X).
delta(2,[c | X]) :- delta(2, X).
delta(3, []).
delta(3,[a | X]) :- delta(3, X).
delta(3,[b | X]) :- delta(5, X).
delta(3,[c | X]) :- delta(4, X).
delta(4, []).
delta(4,[a | X]) :- delta(3, X).
delta(4,[b | X]) :- delta(6, X).
delta(4,[c | X]) :- delta(5, X).
delta(5, []).
delta(5,[a | X]) :- delta(3, X).
delta(5,[b | X]) :- delta(6, X).
delta(5,[c | X]) :- delta(5, X).
delta(6, []).
delta(6,[a | X]) :- delta(6, X).
delta(6,[b | X]) :- delta(6, X).
delta(6,[c | X]) :- delta(6, X).


% KNOWLEDGE BASE 2 –– correct
start(X) :- check1(X), check2(X).
check1([X|Y]) :- other(Y).
check1([]).
other([X|Y]) :- check1(Y).
other([]).
check2([]).
check2([0|X]) :- check2(X).
check2([1|X]) :- step1(X).
step1([0|X]) :- check2(X).
step1([1|X]) :- step2(X).
step1([]).
step2([0|X]) :- step2(X).
step2([1|X]) :- step2(X).
step2([]).
step3([0|X]) :- step4(X).
step3([1|X]) :- step1(X).
step3([]).
step4([0|X]) :- check2(X).
step4([1|X]) :- step1(X).
step4([]).

a([1,2,3]).

% KNOWLEDGE BASE 3 –– correct 
victory(X,Y) :- X\=Y, phase1(X,Y), phase2(X,Y), phase3(X,Y).
phase1(X,Y) :- attr(X), attr(Y).
attr(tim).
attr(joe).
attr(bill).
attr(jane).
attr(ashley).
attr(bob).
attr(phyllis).
attr(sara).
phase2(X,Y) :- work(X), work(Y).
work(tim).
work(ashley).
work(bob).
work(sara).
work(claire).
work(chris).
phase3(X,Y) :- learn(Y), learn(X).
learn(X) :- work(X), pass(X).
pass(claire).
pass(chris).
pass(tim).
pass(sara).
pass(bob).
pass(ashley).



