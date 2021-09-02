/* Alexandra Burke
 * inclass_one.pl
 * 9/03/21
 * In this program we will experiment with a variety of pattern matches.
 * 1) Find the substring "man" (or [..., m, a, n, ...] in array form) inside input text
 * 2) Determine if an input binary number starts with 101 and ends in 0110.
 * 3) Determine if an input string has as its third character a vowel, contains an odd number of characters,
 *    and possesses no more than 2 instances of the letter c.
 * 4) Determine if an input data set contains exactly three integers, has at most one instance of the sequence 
 *    a,b within it, and whose length overall is divisible by 3. 
 * */

% PROBLEM ONE: Find the substring man
start([m | Y]) :- found_m(Y).
start([X | Y]) :- X \= m, start(Y).
found_m([a | Y]) :- found_a(Y).
found_m([m | Y]) :- found_m(Y).
found_m([X | Y]) :- X \= a, X \= m, start(Y).
found_a([n | Y]) :- found_man(Y).
found_a([m | Y]) :- found_m(Y).
found_a([X | Y]) :- X \= n, start(Y).
found_man(X).

% PROBLEM TWO: ANALYZE BINARY
% For this problem you can either split the argument into two sections (i.e. look for 101 and 0110 separately)
% or take an approach to find both at the same time.
binary([1 | X]) :- found_one(X).
found_one([0 | X]) :- found_zero(X).
found_zero([1 | X]) :- found_zero_one(X).
found_zero_one([0 | X]) :- found_end_zero(X).
found_zero_one([1 | X]) :- found_zero_one_one(X).
found_end_zero([0 | X]) :- found_end_zero(X).
found_end_zero([1 | X]) :- found_zero_one(X).
found_zero_one_one([0 | X]) :- final_state(X).
found_zero_one_one([1 | X]) :- beginning(X).
beginning([0 | X]) :- found_end_zero(X).
beginning([1 | X]) :- beginning(X).
final_state([0 | X]) :- found_end_zero(X).
final_state([1 | X]) :- found_zero_one(X).
final_state([]).

% PROBLEM THREE: ANALYZE TEXT
find_letters(X) :- third_letter(X), count(X), no_c(X).
third_letter([_,_,a | X]).
third_letter([_,_,e | X]).
third_letter([_,_,i | X]).
third_letter([_,_,o | X]).
third_letter([_,_,u | X]).

count([_ | X]) :- odd(X).
odd([_ | X]) :- even(X).
odd([]).
even([_ | X]) :- odd(X).

no_c([c | X]) :- one_c(X).
no_c([X | Y]) :- X \= c, no_c(Y).
no_c([]).
one_c([c | X]) :- two_c(X).
one_c([X | Y]) :- X \= c, one_c(Y).
one_c([]).
two_c([X | Y]) :- X \= c, two_c(Y).
two_c([]).

% PROBLEM FOUR: ANALYZE INPUT
analyze(X) :- count_int(X, Z), Z = 3.
count_int([X|Y], Z) :- integer(X), count_int(Y, Z1), Z is Z1 + 1.
count_int([X|Y], Z) :- not(integer(X)), count_int(Y, Z).
count_int([]|0).

find_ab(['a','b'|Y]) :- found_ab(Y).
find_ab(['a',X|Y]) :- X\='b', find_ab([X|Y]).
find_ab([X|Y]) :- X\='a', find_ab(Y).
find_ab(['a']).
find_ab([]).
found_ab(['a',X|Y]) :- X\='b', found_ab([X|Y]).
found_ab([X|Y]) :- X\='a', found_ab(Y).
found_ab([]).
found_ab(['a']).
