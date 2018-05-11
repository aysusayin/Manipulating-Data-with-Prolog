The project is to write a Prolog program which performs some particular tasks for the matches which are played by the football teams in a Football League.
A database is given with a bunch of predicates in the following two form:
  1) team(teamName, hometown).
  2) match(week, homeTeam, homeTeamScore, awayTeam, awayTeamScore).
First one shows the teams that are existing in the database and their home town.
e.g. team(realmadrid, madrid).
This means realmadrid plays its home matches in madrid.
Second one shows the matches played between two teams, their scores and the week that the match is played.
e.g. match(1, kobenhavn, 1, juventus 2).
A match is played between kobenhavn which is the home team and juventus which is the away team in week 1, and juventus defeated kobenhavn with the score of 2-1.

In the project, the tasks are the following:
  1) All Teams:
List all teams in the database.
  2) Match Results:
The predicates to check the teams that the specified team defeated, is defeated by or tied with.
  3) Goals Scored and Conceded:
Give the number of the goal scored or conceded by the specified team in the specified week.
  4) Total Average of a Team:
Show the average of the given team in the given week. Average is the total number of goals scored minus the total number of goals conceded.
  5) Order and Top Three:
List the league order in the given week. Also list the top three teams in that week.
A few predicates are implemented to achieve these goals which are explained below.

Detailed explanation can be found in Project Report pdf.
