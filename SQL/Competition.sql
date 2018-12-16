/*	ManOverTheRainbow
*	Mar 5 2018 -TheDayThatHappened
*	SQLite version 3
*
*/

--This command is the CREATE function.
--USE IN TERMINAL OR COMMAND LINE 
sqlite3 Competitions.db;

/*	Here you can establish users and permissions if you have the need to. 
*	the way sqlite works is it is one application that you can import and export databases into. 
*	It doesnt make sense to create users on it when it is built on one application accessible to one user on one computer. 
*	The Idea is that his Database will be built for one person to be the 'gamekeeper.' of course the computer will regularly need to be backed up
*/
--This is the first table, for the Venue or location of the event tournament
CREATE TABLE VenueDetails 
(VenueID INTEGER PRIMARY KEY, 
Address NOT NULL VARCHAR(95),
City NOT NULL VARCHAR(25) 
Country NOT NULL VARCHAR(3), 
Region NOT NULL VARCHAR(10), 
Postal_Code NOT NULL NUMERIC(10), 
Organization DEFAULT NULL VARCHAR(20));--Every script has to end with (;) even if your typing multiple queries in SQLite

--Table number 2. This is the details of the game. Whether it is a tennis, or smite esports.
CREATE TABLE GameDetails
(GameID INTEGER PRIMARY KEY,
Game_Name NOT NULL VARCHAR(25),
--Game_Mode is defaulted to null in case the Game_Name doesnt have a different mode, like tennis for example. 
Game_Mode DEFAULT NULL VARCHAR(10)
Num_of_players NOT NULL NUMERIC(10)
--Duration would be inputed '1h60m60s' 'number of single hours(h),number of minutes(m), number of seconds(s)
Max_Duration DEFAULT NULL VARCHAR(8) 
Max_Score DEFAULT NULL NUMERIC(20);

--Table 3 Teams. Each game requires 2 teams or more in order to start. Although some game modes may have more. We are assuming that 
--there will only be 2 teams each game.
CREATE TABLE TeamDetails
(TeamID INTEGER PRIMARY KEY,
Team_Name NOT NULL VARCHAR(20),
--Placed_ is the ammount of times the team has been place first second  or third in the tournament. 
Placed_First DEFAULT NULL NUMERIC(20),
Placed_Second DEFAULT NULL NUMERIC(20),
Placed_Third DEFAULT NULL NUMERIC(20)
--Tournaments is the ammount of tournaments the team has participated in
Tournaments DEFAULT NULL NUMERIC(20),
Num_of_TeamMates NOT NULL NUMERIC(20));

--individual player stats and important information
CREATE TABLE PlayerDetails
(PlayerID INTEGER PRIMARY KEY,
Player_Name NOT NULL VARCHAR(20),
TeamID INTEGER FOREIGN KEY REFERENCES TeamDetails(TeamID),
Player_Role DEFAULT NULL VARCHAR(10)
Player_Score DEFAULT NULL NUMERIC(10)

--Tournament winners, teams, and the game that is being played
CREATE TABLE TournamentDetails
(TournamentID INTEGER PRIMARY KEY,
Date_Start NOT NULL DATE,
Date_End NOT NULL DATE,
--Place the data in like (team1, team2, team3,...)
Teams NOT NULL TEXT,
--Team that won first, second, and third. 
First_Place NOT NULL VARCHAR(10),
Second_Place NOT NULL VARCHAR(10),
Third_Place NOT NULL VARCHAR(10),
GameID INTEGER FOREIGN KEY REFERENCES GameDetails(GameID)) --gotta know what game they are playing. 

CREATE TABLE MatchDetails
(MatchID INTEGER PRIMARY KEY,
TournamentID INTEGER FOREIGN KEY REFERENCES TournamentDetails(TournamentID), --this  will allow you to associate the match to a specific tournament.
--the name of the team that won the match
Team_Win NOT NULL VARCHAR(20),
--the name of the team that lost the match
Team_Loss NOT NULL VARCHAR(20),
--input the Total_Score like (WinningTeam)/(LosingTeam)-(50/39)
Total_Score NOT NULL VARCHAR(10),
--Match_Duration will be input the same as Max_Duration.
Match_Duration NOT NULL VARCHAR(10))
