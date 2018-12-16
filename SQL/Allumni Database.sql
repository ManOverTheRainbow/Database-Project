/*
 * College Allumni Database
 * Jonathin Risoldi, ManOverTheRainbow, Shay Walker, Tyler Carrier, Romeo Sturkey
 * 23 March 2018
 * MS SQL Server 2017
 */
 
CREATE DATABASE AlumniDB; --You can use GUI if you so desire, or call it something else if need be

 --Create users and give them permissions through the GUI based on who needs what ammount of access
 
 --Shay Walker's Creation
CREATE TABLE AlumniDetails(
	--Identifies individuals by a specific number. can be related to other tables
	PersonalID INT IDENTITY(1,1) PRIMARY KEY
	,First_Name NOT NULL VARCHAR(10)
	,Middle_Name VARCHAR(40)
	,Last_Name NOT NULL VARCHAR(40)
 );
 
	--Jonathin Risoldi's Creation
CREATE TABLE ContactDetails(
	AddressID INT IDENTITY(1,1) PRIMARY KEY
	,Phone_Number NOT NULL DECIMAL(25)
	,Email NOT NULL VARCHAR(50)
	,LinkedInURL VARCHAR(100)
	,PersonalID INT IDENTITY(1,1) FOREIGN KEY(PersonalID) REFERENCES AlumniDetails(PersonalID)
);	
	--ManOverTheRainbow's Creation
CREATE TABLE OtherDetails(
	--Most of the information is going to be NULL
	--This table will be referenced by a FOREIGN KEY which will connect it to the other tables
	Notes TEXT(280)
	,Speaking_History TEXT(200)
	,PersonalID INT IDENTITY(1,1) FOREIGN KEY(PersonalID) REFERENCES AlumniDetails(PersonalID)
);

	--Tyler Carrier's Creation
CREATE TABLE EducationDetails(
	EducationID INT IDENTITY(1,1) PRIMARY KEY
	,CairnDegree NOT NULL VARCHAR(80)
	,OtherDegree VARCHAR(80)
	,CairnGraduationDate NOT NULL VARCHAR(12)
	,OtherGraduationDate VARCHAR(12)
	,CairnInternships NOT NULL VARCHAR(128)
	,PersonalID INT IDENTITY(1,1) FOREIGN KEY(PersonalID) REFERENCES AlumniDetails(PersonalID)
);

	--Romeo Sturkey's  Creation
CREATE TABLE EmploymentDetails(
	CurrentOccupation NOT NULL VARCHAR(80)
	,PersonalID INT IDENTITY(1,1) FOREIGN KEY(PersonalID) REFERENCES AlumniDetails(PersonalID)	
);	
	
