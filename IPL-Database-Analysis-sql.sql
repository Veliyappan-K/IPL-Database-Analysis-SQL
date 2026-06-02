Create Database IPL_DB;
Use ipl_DB;

/* Teams Table */
Create table Teams1 (
Team_ID INT PRIMARY KEY,
Team_Name VARCHAR(20)
);

/* Teams Insert */
Insert into Teams1 Values
(1,'CSK'),
(2,'MI'),
(3,'RCB'),
(4,'KKR'),
(5,'SRH'),
(6,'DC'),
(7,'PBKS'),
(8,'RR'),
(9,'GT'),
(10,'LSG');

/* Players Table */
Create table Players1 (
Player_ID INT PRIMARY KEY,
Player_Name VARCHAR(20),
Team_ID INT,
Role VARCHAR(30),
FOREIGN KEY (Team_ID) REFERENCES Teams1(Team_ID)
);

/* Players Insert */
Insert into Players1 Values 
(101,'Ms Dhoni',1,'Wicket Keeper'),
(102,'Ruturaj Gaikwad',1,'Batsman'),
(103,'Shivam Dube',1,'All Rounder'),
(104,'Sanju Samson',1,'Batsman'),
(105,'Noor Ahmad',1,'Bowler'),

(106,'Rohit Sharma',2,'Batsman'),
(107,'Suryakumar Yadav',2,'Batsman'),
(108,'Hardik Pandya',2,'All Rounder'),
(109,'Jasprit Bumrah',2,'Bowler'),
(110,'Tilak Varma',2,'Batsman'),

(111,'Virat Kohli',3,'Batsman'),
(112,'Rajat Patider',3,'Batsman'),
(113,'Krunal Pandya',3,'All Rounder'),
(114,'Bhuvneshwar Kumar',3,'Bowler'),
(115,'Jitesh Sharma',3,'Wicket Keeper'),

(116,'Ajinkya Rahane',4,'Batsman'),
(117,'Sunil Narine',4,'All Rounder'),
(118,'Cameron Green',4,'All Rounder'),
(119,'Rinku Singh',4,'Batsman'),
(120,'Varun Chakaravarthy',4,'Bowler'),

(121,'Pat Cummins',5,'All Rounder'),
(122,'Travis Head',5,'Batsman'),
(123,'Abhishek Sharma',5,'All Rounder'),
(124,'Heinrich Klaasen',5,'Wicket Keeper'),
(125,'Eshan Malinga',5,'Bowler'),

(126,'Axar Patel',6,'All Rounder'),
(127,'David Miller',6,'Batsman'),
(128,'KL Rahul',6,'Wicket Keeper'),
(129,'Kuldeep Yadav',6,'Bowler'),
(130,'Sammer Rizvi',6,'Batsman'),

(131,'Shreyas Iyer',7,'Batsman'),
(132,'Marcus Stoinis',7,'All Rounder'),
(133,'Arshdeep Singh',7,'Bowler'),
(134,'Shashank Singh',7,'All Rounder'),
(135,'Prabhsimran Singh',7,'Wicket Keeper'),

(136,'Riyan Parag',8,'All Rounder'),
(137,'Dhruv Jurel',8,'Wicket Keeper'),
(138,'Yashasvi Jaiswal',8,'Batsman'),
(139,'Vaibhav Sooryavanshi',8,'Batsman'),
(140,'Jofra Archer',8,'Bowler'),

(141,'Shubman Gill',9,'Batsman'),
(142,'Sai Sundharsan',9,'Batsman'),
(143,'Rashid Khan',9,'Bowler'),
(144,'Rahul Tewatia',9,'All Rounder'),
(145,'Jos Buttler',9,'Wicket Keeper'),

(146,'Rishaba Pant',10,'Wicket Keeper'),
(147,'Nicholas Pooran',10,'Wicket Keeper'),
(148,'Mitchell Marsh',10,'All Rounder'),
(149,'Avesh Khan',10,'Bowler'),
(150,'Ayush Badoni',10,'Batsman');

/* Matches Table */
Create table Matches1 (
Match_ID INT PRIMARY KEY,
Team1 VARCHAR(20),
Team2 VARCHAR(20),
Winner VARCHAR(20),
Match_Date DATE
);

/* Matches Insert */
Insert into Matches1 Values
(1,'CSK','MI','CSK','2026-03-22'),
(2,'RCB','KKR','RCB','2026-03-23'),
(3,'SRH','DC','SRH','2026-03-24'),
(4,'PBKS','RR','RR','2026-03-25'),
(5,'GT','LSG','GT','2026-03-26'),

(6,'MI','RCB','MI','2026-03-27'),
(7,'CSK','KKR','CSK','2026-03-28'),
(8,'DC','PBKS','DC','2026-03-29'),
(9,'RR','GT','RR','2026-03-29'),
(10,'LSG','SRH','LSG','2026-03-31'),

(11,'CSK','RCB','CSK','2026-04-01'),
(12,'MI','DC','MI','2026-04-02'),
(13,'KKR','RR','KKR','2026-04-03'),
(14,'PBKS','GT','GT','2026-04-04'),
(15,'SRH','CSK','SRH','2026-04-05'),

(16,'LSG','MI','MI','2026-04-06'),
(17,'RCB','DC','RCB','2026-04-07'),
(18,'RR','CSK','RR','2026-04-08'),
(19,'GT','KKR','GT','2026-04-09'),
(20,'PBKS','SRH','SRH','2026-04-10');

/* Score Table */
Create table Scores1 (
Score_ID INT PRIMARY KEY,
Player_ID INT,
Match_ID INT,
Runs INT,
Balls INT,
Fours INT,
Sixes INT,
FOREIGN KEY (Player_ID) REFERENCES Players1(Player_ID),
FOREIGN KEY (Match_ID) REFERENCES Matches1(Match_ID)
);

/* Score insert */
Insert into Scores1 Values
(1,101,1,45,32,4,2),
(2,102,1,78,55,8,3),
(3,106,1,65,48,6,2),
(4,107,1,52,35,5,3),

(5,111,2,88,60,10,4),
(6,112,2,40,28,4,1),
(7,116,2,72,50,7,2),
(8,117,2,35,22,2,2),

(9,121,3,60,42,5,3),
(10,122,3,95,58,11,4),
(11,126,3,48,37,4,1),
(12,127,3,70,49,8,2),

(13,131,4,55,40,5,2),
(14,132,4,38,25,3,2),
(15,136,4,82,54,9,3),
(16,137,4,61,44,6,2),

(17,141,5,90,62,10,4),
(18,142,5,67,46,7,2),
(19,146,5,74,52,8,3),
(20,147,5,50,33,5,2);

/* Query */
/* 1.Team Wise Total Runs */
Select t.Team_Name,
sum(s.Runs) AS Total_Runs
From Teams1 t
Join Players1 p ON t.Team_ID = p.Team_ID
Join Scores1 s ON p.Player_ID = s.Player_ID
Group By t.Team_Name
Order By Total_Runs DESC;

/* 2.Top 5 Runs Scores */
Select p.Player_Name,
sum(s.Runs) AS Total_Runs
From Players1 p
Join Scores1 s ON p.Player_ID = s.Player_ID
Group By p.Player_Name
Order By Total_Runs DESC
LIMIT 5;

/* 3 Most Sixes Hit Player */
Select p.Player_Name,
sum(s.Sixes) AS Total_Sixes
From Players1 p
Join Scores1 s ON p.Player_ID = s.Player_ID
Group By p.Player_Name
Order By Total_Sixes DESC
LIMIT 1;

/* 4. Most Fours Hit Player */
Select p.Player_Name,
sum(s.Fours) AS Total_Fours
From Players1 p
Join Scores1 s ON p.Player_ID = s.Player_ID
Group By p.Player_Name
Order By Total_Fours DESC
LIMIT 1;

/* 5.Average Runs Per Player */
Select p.Player_Name,
AVG(s.Runs) AS Average_Runs
From Players1 P
Join Scores1 s ON p.Player_ID = s.Player_ID
Group By p.Player_Name
Order By Average_Runs DESC;

/* 6. Match Wise Highest Score */
Select Match_ID,
MAX(Runs) AS Highest_Score
From Scores1
Group By Match_ID;