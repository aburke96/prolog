% This function generates the length of an input array
len([],0).
len([Head|Tail],Len)  :-  len(Tail,Temp),  Len  is  Temp+1. 

% Iterates through an input array and a predefined max value, 
% and determintes the max of the array
max([Head|Tail],Tmp,MyMax)  :- Head  >  Tmp, max(Tail,Head,MyMax).
max([Head|Tail],Tmp,MyMax)  :- Head  =<  Tmp, max(Tail,Tmp,MyMax).
max([],Tmp,Tmp).

getMax(List,Max)  :- List  =  [H|_], max(List,H,Max).

% Iterates through an input array and a predefined min value, 
% and determintes the min of the array
min([Head|Tail],Tmp,MyMin)  :- Head  <  Tmp, min(Tail,Head,MyMin).
min([Head|Tail],Tmp,MyMin)  :- Head  >=  Tmp, min(Tail,Tmp,MyMin).
min([],Tmp,Tmp).

getMin(List,Min)  :- List  =  [Head|Tail], min(Tail,Head,Min).

% Appends two lists together
append([],List2,List2).
append([Head|Tail],List2,[Head|List3])  :-  append(Tail,List2,List3).

% Takes an input list and returns the inverse.
revList([Head|Tail],Tmp,Reverse):-  revList(Tail,[Head|Tmp],Reverse).
revList([],Tmp,Tmp).

% doing math!
doAdd([Head|Tail], Tmp, Total) :- Curr is Tmp + Head, doAdd(Tail, Curr, Total). 
doAdd([], Tmp, Tmp).

doSub([Head|Tail], Tmp, Total) :- Curr is Tmp - Head, doSub(Tail, Curr, Total). 
doSub([], Tmp, Tmp).

doMul([Head|Tail], Tmp, Total) :- Curr is Tmp * Head, doMul(Tail, Curr, Total). 
doMul([], Tmp, Tmp).

doDiv([Head|Tail], Tmp, Total) :- Curr is Tmp / Head, doDiv(Tail, Curr, Total). 
doDiv([], Tmp, Tmp).

% Function to perform mathematical operations that are entered in the 
% form of two arrays. Where the first array contains the list of 
% numbers, and the second array contains a list of operators, 
% starting with a + sign to load the first number in.
doMath([], [], Tmp, Tmp).
doMath([Head|Tail], ['+'|Ops], Tmp, N) :- Curr is Tmp+Head, doMath(Tail, Ops, Curr, N).
doMath([Head|Tail], ['-'|Ops], Tmp, N) :- Curr is Tmp-Head, doMath(Tail, Ops, Curr, N).
doMath([Head|Tail], ['*'|Ops], Tmp, N) :- Curr is Tmp*Head, doMath(Tail, Ops, Curr, N).
doMath([Head|Tail], ['/'|Ops], Tmp, N) :- Curr is Tmp/Head, doMath(Tail, Ops, Curr, N).

% Calls the doMath function
makeMath(Val, Op, N) :- doMath(Val, Op, 0, N). 

