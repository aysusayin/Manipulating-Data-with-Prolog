%0.1 All Teams

% findAll finds all predicates matching to the given predicate goal and
% puts into the L, length calculates the length of the list and
% permutation forms all permutation of teams.
allTeams(List,N):-findall(Atom,team(Atom,_),L),length(L,N),permutation(L,List).

%0.2 Match Results

% if the teams score is more than the other team's score, other team is
% added to list.This is done by findall function. Two findall functions are used, one is for the mathes that the team is home team and the other one is for the away team. These lists are appended to get the final list.length function finds the length of the given list.
% T Team
% W Week
% L List of the teams that the team wins.
% N number of elements in the list
wins(T,W,L,N):- W1 is W+1, findall(OT,(match(W2,T,TS,OT,OTS),TS>OTS,W2<W1),L1),findall(OT,(match(W2,OT,OTS,T,TS),TS>OTS,W2<W1),L2),append(L1,L2,L), length(L,N).

% If the teams score is less than the other team's score, other team is added to list. This is done by findall function. Two findall functions are used, one is for the matches that the team is home team and the other one is for the away team. These lists are appended to get the final list.length function finds the length of the given list.
% T Team
% W Week
% L List of the teams that the team losses.
% N number of elements in the list
losses(T,W,L,N):- W1 is W+1,findall(OT,(match(W2,T,TS,OT,OTS),TS<OTS,W2<W1),L1),findall(OT,(match(W2,OT,OTS,T,TS),TS<OTS,W2<W1),L2),append(L1,L2,L), length(L,N).

%If the team’s score is equal to the other team's score, other team is added to list This is done by findall function. Two findall functions are used, one is for the matches that the team is home team and the other one is for the away team. These lists are appended to get the final list. length function finds the length of the given list.
% T Team
% W Week
% L List of the teams that the team draws.
% N number of elements in the list
draws(T,W,L,N):- W1 is W+1, findall(OT,(match(W2,T,TS,OT,OTS),TS=OTS,W2<W1),L1),findall(OT,(match(W2,OT,OTS,T,TS),TS=OTS,W2<W1),L2),append(L1,L2,L), length(L,N).

%0.3 Goals Scored and Conceded

%When week is 0, nobody has scores.(base case)
scored(_,0,S):-S is 0.
% Find all matches the team played with findall function and sum up the
% score they made with the sumOfElements predicate. Call scored again
% recursively to calculate the scores in the previous weeks. T team W
% week S score And sum them to get the result S.
scored(T,W,S):- W>0,findall(TS,match(W,T,TS,_,_),L1),findall(TS,match(W,_,_,T,TS),L2),append(L1,L2,L3),sumOfElements(N,L3), WL is W-1,scored(T,WL,M), S is N+M.

%When week is 0, nobody has scores.(base case)
conceded(_,0,C):- C is 0.
% Find all matches the team played with findall function and sum up the goals it conceded with the sumOfElements predicate. Call conceded recursively to calculate the conceded goals in the previous weeks. And sum them to get the result C.
% T team
% W week
% C conceded goals
conceded(T,W,C):-W>0,findall(OTS,match(W,T,_,_,OTS),L1),findall(OTS,match(W,_,OTS,T,_),L2),append(L1,L2,L3),sumOfElements(N,L3), WL is W-1,conceded(T,WL,M), C is N+M.


%sums up the values of the elements of the given list.
%This predicate calls it self recursively with the tail of the given list and sums up the head with the value that is retrieved from the recursive call.
%N sum
sumOfElements(N,[]):-N is 0.
sumOfElements(N,[Head|Tail]):-sumOfElements(M,Tail), N is M+Head.

%average is the scored - conceded. it is calculated by calling scored and conceded predicates and subtracting the results.
%T team
%W week
%A average
average(T,W,A):-scored(T,W,S), conceded(T,W,C), A is S-C.

%0.4 Order and Top Three

%form tuples (Average, Team) and add them to the list
%Form tuple (Average, Team) of the head of the list, call formTuples recursively and append the tuple with the list that is retrieved from the recursive call.
formTuples(_,[],LT):-append([],[],LT). %base case
%W week
%second parameter  team list
%LT is list of tuples
formTuples(W,[Head|Tail],LT):- formTuples(W,Tail,LT1),average(Head,W,A), append([(A,Head)],LT1,LT).

% From the tuple list, take the second element of the head tuple and
% append it with the list that is retrieved from the recursive call.
makeTeamList([],List):-append([],[],List). %base case
%first parameter is tuple list
%second one is the team list
makeTeamList([(_,T)|Tail],List):- makeTeamList(Tail,L1), append(L1,[T],List).

%give the team order of that week according to the averages. Get all the teams in the league and form the tuple list from them.  Sort this tuple list, according to averages and call makeTeamList predicate to achieve theresult.
%L order list
%W week
order(L,W):-allTeams(L1,_),formTuples(W,L1,LT),sort(LT,LS),makeTeamList(LS,L).


% take the top three team of that week from order predicate and add to a
% list W week First parameter is the top three list
topThree([A1,A2,A3],W):-order([O1,O2,O3|_],W), A1=O1, A2=O2, A3=O3.


















