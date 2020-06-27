create database Minions

CREATE TABLE Minions (
    Id int PRIMARY KEY,
    Name nvarchar,
    Age int
);

CREATE TABLE Towns (
    Id int PRIMARY KEY,
    Name nvarchar(50),
);

alter table Minions
add TownsId int foreign key references Towns(Id)

INSERT INTO Towns(Id,[Name])
VALUES
	(1,'Sofia'),
	(2,'Plovdiv'),
	(3,'Varna')

INSERT INTO Minions(Id,[Name],Age,TownId)
	VALUES
	(1,'Kevin',22,1),
	(2,'Bob',15,3),
	(3,'Steward',NULL,2)

TRUNCATE TABLE Minions

DROP TABLE Minions
DROP TABLE Towns

CREATE TABLE People (
    Id int PRIMARY KEY Identity,
    [Name] nvarchar(200) NOT NULL,
    Picture VARBINARY(MAX),
	Height DECIMAL(5,2),
	[Weight] DECIMAL(5,2),
	Gender char(1) NOT NULL CHECK(Gender='m' OR Gender='f'),
	Birthdate DATE Not Null,
	Biography NVARCHAR(MAX)
);

INSERT INTO People([Name], Picture, Height, Weight, Gender, Birthdate,Biography)
	VALUES
		('Stela',Null,1.65,44.55,'f','2000-09-22',Null),
		('Ivan',Null,2.15,95.55,'m','1989-11-02',Null),
		('Qvor',Null,1.55,33.00,'m','2010-04-11',Null),
		('Karolina',Null,2.15,55.55,'f','2001-11-11',Null),
		('Pesho',Null,1.85,90.00,'m','1983-07-22',Null)

CREATE TABLE Users(
	Id BIGINT PRIMARY KEY Identity NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX) CHECK(DATALENGTH(ProfilePicture) <= 900 *1024),
	LastLoginTime DateTime2 NOT NULL,
	IsDeleted BIT NOT NULL
);

INSERT INTO Users(Username, [Password],LastLoginTime, IsDeleted) VALUES
('Ivan','123','06.27.2020',0),
('Ivan1','123','06.27.2020',1),
('Ivan2','123','06.27.2020',0),
('Ivan3','123','06.27.2020',0),
('Ivan4','123','06.27.2020',0)

select * from Users

alter table users
drop constraint [PK__Users__3214EC07A890F653]

alter table Users
add constraint PK_Users_CompositeIdUsername
PRIMARY KEY(Id,Username)

alter table Users
add constraint CK_Users_PasswordLength
CHECK(LEN([Password])>=5)

alter table Users
add constraint DF_Users_LastLoginTime
DEFAULT GETDATE() for LastLoginTime

