/*DATABASE DESIGN EXCSERSISES:*/


/*We create the database "escaperoom":*/
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS escaperoom;
CREATE DATABASE escaperoom;


/*Task 1)*/
CREATE TABLE escaperooms (
	RoomID INT PRIMARY KEY AUTO_INCREMENT, 
    Title VARCHAR(40) UNIQUE, 
    Theme VARCHAR(40), 
    DifficultyLevel INT, 
    Duration TIME
);


/*Task 2)*/
CREATE TABLE puzzles (
	PuzzleID INT PRIMARY KEY AUTO_INCREMENT,
    RoomID INT,
    PuzzleName VARCHAR(40),
    `Description` VARCHAR(150),
    PuzzleType VARCHAR(40),
    DifficultyRating INT,
    FOREIGN KEY (RoomID) REFERENCES escaperooms(RoomID)
);


/*Task 3)*/
CREATE TABLE teams (
	TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(40),
    StartTime DATETIME,
    EndTime DATETIME,
    CompletionStatus VARCHAR(40)
);


/*Task 4)*/
CREATE TABLE players (
	TeamID INT,
	PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(40),
    Nickname VARCHAR(20),
    Email VARCHAR(60),
    FOREIGN KEY (TeamID) REFERENCES teams(TeamID)
);


/*Task 5)*/
CREATE TABLE teamprogress (
	ProgressID INT PRIMARY KEY AUTO_INCREMENT,
    TeamID INT,
    PuzzleID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    SolvedStatus VARCHAR(40),
    FOREIGN KEY (TeamID) REFERENCES teams(TeamID),
    FOREIGN KEY (PuzzleID) REFERENCES puzzles(PuzzleID)
);


/*Task 6)*/
CREATE TABLE hints (
	HintID INT PRIMARY KEY AUTO_INCREMENT,
    PuzzleID INT,
    HintText VARCHAR(100),
    UsageCount INT,
    FOREIGN KEY (PuzzleID) REFERENCES puzzles(PuzzleID)
);


/*Task 7)*/
CREATE TABLE playeractions (
	ActionID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerID INT,
    PuzzleID INT,
    ActionType VARCHAR(40),
    ActionTimeStamp DATETIME,
    FOREIGN KEY (PlayerID) REFERENCES players(PlayerID),
    FOREIGN KEY (PuzzleID) REFERENCES puzzles(PuzzleID)
);



/*KEY FEATURES POPULATING TABLES AND EXAMPLES*/


/*We populate 3 or more rows for each table:*/

/*Escape Room Table:*/
INSERT INTO escaperooms (Title, Theme, DifficultyLevel, Duration)
VALUES ("Haunted House", "Horror", 3, "01:30:00");
INSERT INTO escaperooms (Title, Theme, DifficultyLevel, Duration)
VALUES ("Wizards Keep", "Magic", 2, "01:30:00");
INSERT INTO escaperooms (Title, Theme, DifficultyLevel, Duration)
VALUES ("Castle Doom", "Superhero", 1, "01:30:00");

/*Puzzles Table:*/
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (1, "Haunted House Variation 1", "Hardest non-family friendly version of Haunted House. Recommended players: 4", "Murder Mystery", 3);
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (2, "Wizards Keep Variation 1", "A magical experience in the Harry Pottter style puzzle. Recommended players: 3", "Magical Spells", 2);
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (3, "Castle Doom Variation 1", "Help the Avengers defeat DR. Doom! Recommended players: 3", "Code breaking", 1);
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (1, "Haunted House Variation 2", "Danger! Experience all the classic villains hunting you down! Recommended players: 4", "Murder Mystery", 2);
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (2, "Wizards Keep Variation 2", "Help Harry Potter escape the chamber of secrets! Recommended players: 3", "Magical Spells", 2);
INSERT INTO puzzles (RoomID, PuzzleName, `Description`, PuzzleType, DifficultyRating)
VALUES (3, "Castle Doom Variation 2", "DR. Doom has changed the timeline! Help the Avengers reset it! Recommended players: 3", "Code breaking", 2);

/*Hints Table:*/
INSERT INTO hints (PuzzleID, HintText, UsageCount)
VALUES (1, "Paintings are full of hidden gems", 0);
INSERT INTO hints (PuzzleID, HintText, UsageCount)
VALUES (2, "Wands may need magic from the stars", 0);
INSERT INTO hints (PuzzleID, HintText, UsageCount)
VALUES (3, "The castle walls may not be what they seem to be", 2);

/*Teams Table:*/
INSERT INTO teams (TeamName, StartTime, EndTime, CompletionStatus)
VALUES ("StarkIndustries", "2024-10-11 11:48:55", "2024-10-11 13:54:22", "Solved");
INSERT INTO teams (TeamName, StartTime, EndTime, CompletionStatus)
VALUES ("TeenTitans", "2024-10-11 12:32:05", "2024-10-11 13:46:58", "Solved");
INSERT INTO teams (TeamName, StartTime, EndTime, CompletionStatus)
VALUES ("PowerRangers", "2024-10-11 15:04:55", "2024-10-11 00:00:00", "OnGoing");

/*TeamProgress Table:*/
INSERT INTO teamprogress (TeamID, PuzzleID, StartTime, EndTime, SolvedStatus)
VALUES (1, 6, "2024-10-11 11:48:55", "2024-10-11 13:54:22", "Solved");
INSERT INTO teamprogress (TeamID, PuzzleID, StartTime, EndTime, SolvedStatus)
VALUES (2, 3, "2024-10-11 12:32:05", "2024-10-11 13:46:58", "Solved");
INSERT INTO teamprogress (TeamID, PuzzleID, StartTime, EndTime, SolvedStatus)
VALUES (3, 5, "2024-10-11 15:04:55", "2024-10-11 00:00:00", "OnGoing");

/*Players Table:*/
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (1, "John Hawthorn", "JohnH", "johnh@gmail.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (1, "Lars Putin", "BigLars", "larsputin@gmail.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (1, "Gabrielle Bree", "Gabbyyy", "gabbybree@outlook.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (2, "Carlos Simpsons", "CaSimps", "carlostheman@hotmail.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (2, "James Vowles", "ItsJames", "jamesvowles@icloud.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (2, "Tom Simons", "TommyInnit", "supercooltom@gmail.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (3, "Lewis Hamilton", "Number1DriverFerrari", "sirlewisham@icloud.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (3, "Charles Leclerc", "NothinJustIncident", "charlesworldchamp@outlook.com");
INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (3, "Frederic Vasseur", "TheBlanMustGoOn", "realteamboss@blanteam.com");

/*PlayerActions Table:*/
INSERT INTO playeractions(PlayerID, PuzzleID, ActionType, ActionTimeStamp)
VALUES (2, 6, "CrackedEndCode", "2024-10-11 13:54:22");
INSERT INTO playeractions(PlayerID, PuzzleID, ActionType, ActionTimeStamp)
VALUES (4, 3, "HintUsed", "2024-10-11 13:02:12");
INSERT INTO playeractions(PlayerID, PuzzleID, ActionType, ActionTimeStamp)
VALUES (5, 5, "HintUsed", "2024-10-11 15:58:34");


/*Now that we have populated the tables, lets get some insight:*/


/*We want to see which escaperooms are hardest. We will check for hint usages:*/
SELECT PuzzleID, UsageCount
FROM hints
ORDER BY UsageCount DESC;
/*We can assume that PuzzleID 3 is the hardest since most usages of hints lie here*/


/*Another example of checking for hardest difficulty is checking the average time each team spent on the puzzles:*/
SELECT PuzzleID, AVG(TIMESTAMPDIFF(MINUTE, StartTime, EndTime)) AS AverageTimeSpent
FROM teamprogress
GROUP BY PuzzleID
ORDER BY AverageTimeSpent DESC;
/*We get some funky numbers because TeamID 3 are still ongoing their level. The rest we can see used 125 and 74 minutes 
to finish their puzzles. We could assume that puzzle 6 is harder than the rest*/


/*Lastly, we have a team where a friend wants to play instead of the dad. We update the table players and queries the players with TeamID 3:*/
DELETE FROM players 
WHERE `Name` = "Lewis Hamilton";

INSERT INTO players (TeamID, `Name`, Nickname, Email)
VALUES (3, "Carlos Sainz", "Williams2025", "carlossainzjunior@hotmail.com");

SELECT *
FROM players
WHERE TeamID = 3;
/*We succesfully removed Lewis Hamilton and added Carlos Sainz to TeamID 3 and queried players with TeamID 3*/
