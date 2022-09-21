% Alexandra Burke
% Prolog Homework #2
%
% Problem #1: 
% Create a prolog program that will recognize strings of a's, b's, and c's 
% such that no letter is identical to its predecessor, 
% and that there are at most two instances of the substrings 'ab' and 'bc'
% [a combined two instances of the sequences, not at most 2 ab and at most 2bc] 

% Problem #2: 
% Create a prolog program that will take as input a series of numbers and letters 
% (single digit numbers and individual characters). 
% It will return true if there is an even number of letters present,
% there are at most 3 numbers that are greater than 7, 
% and if the total length of the array is cleanly divisible by three. 
% Gets the length of the input 

% 1 
question1([Head|Tail]) :- q1func([Head|Tail], 0).

q1func(['a'|Tail], Count) :- Count =< 2, foundA(Tail, Count).
q1func(['b'|Tail], Count) :- Count =< 2, foundB(Tail, Count).
q1func(['c'|Tail], Count) :- Count =< 2, foundC(Tail, Count).
q1func([], Count).

foundA(['b'|Tail], Count) :- Count =< 2, Index is Count + 1, q1func(['b'|Tail], Index).
foundA(['c'|Tail], Count) :- Count =< 2, q1func(['c'|Tail], Count).
foundA([], Count).
foundB(['a'|Tail], Count) :- Count =< 2, q1func(['a'|Tail], Count).
foundB(['c'|Tail], Count) :- Count =< 2, Index is Count + 1, q1func(['c'|Tail], Index).
foundB([], Count).
foundC(['a'|Tail], Count) :- Count =< 2, q1func(['a'|Tail], Count).
foundC(['b'|Tail], Count) :- Count =< 2, q1func(['b'|Tail], Count).
foundC([], Count).





% 2
question2([Head|Tail]) :- q2func([Head|Tail], 0), lengthCheck([Head|Tail]).

q2func([Head|Tail], Count) :- char_type(Head, alpha), oddNumLetters(Tail, Count).
q2func([Head|Tail], Count) :- not(char_type(Head, alpha)), foundANum([Head|Tail], Count).
q2func([], Count).

foundANum([Head|Tail], Count) :- Head =< 7, q2func(Tail, Count).
foundANum([Head|Tail], Count) :- Head > 7, Count < 3, Index is Count + 1, q2func(Tail, Index).
foundANum([], Count).

oddNumLetters([Head|Tail], Count) :- char_type(Head, alpha), evenNumLetters(Tail, Count).
oddNumLetters([Head|Tail], Count) :- not(char_type(Head, alpha)), foundANum(Tail, Count).
evenNumLetters([Head|Tail], Count) :- char_type(Head, alpha), oddNumLetters(Tail, Count).
evenNumLetters([Head|Tail], Count) :- not(char_type(Head, alpha)), foundANum(Tail, Count).
evenNumLetters([], Count).

len([Head|Tail],Len)  :-  len(Tail,Temp),  Len  is  Temp + 1. 
len([],0).

lengthCheck([Head|Tail]) :- len([Head|Tail], X), mod(X, 3) =:= 0.
