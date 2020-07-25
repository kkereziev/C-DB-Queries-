CREATE DATABASE Movies

USE Movies
go

CREATE TABLE Directors(
	[Id] int PRIMARY KEY Identity,
	[DirectorName] nvarchar(50) NOT NULL,
	[Notes] nvarchar(250)
);

ALTER TABLE Directors
ADD CONSTRAINT UC_Director
UNIQUE(DirectorName)


INSERT INTO Directors(DirectorName,Notes) VALUES
('Ivan Petkov','test'),
('Ivan Cankov','test'),
('Krum Cankov','test'),
('Petko Cankov',NULL),
('Mitko Cankov',NULL)

CREATE TABLE Genres(
	[Id] int PRIMARY KEY Identity,
	[GenreName] nvarchar(50) NOT NULL,
	[Notes] nvarchar(250)
);

INSERT INTO Genres(GenreName,Notes) VALUES
('female','test'),
('male','test'),
('female','test'),
('male',NULL),
('female',NULL)

CREATE TABLE Categories(
	[Id] int PRIMARY KEY Identity,
	[CategoryName] nvarchar(50) NOT NULL,
	[Notes] nvarchar(250)
);

INSERT INTO Categories([CategoryName],Notes) VALUES
('test','test'),
('test','test'),
('test','test'),
('test',NULL),
('test',NULL)

CREATE TABLE Movies(
	[Id] int PRIMARY KEY Identity,
	[Title] nvarchar(50) NOT NULL,
	[CopyrightYear] Date NOT NULL,
	[Length] int NOT NULL,
	[DirectorId] int FOREIGN KEY REFERENCES Directors(Id),
	[GenreId] int FOREIGN KEY REFERENCES Genres(Id),
	[CategoryId] int FOREIGN KEY REFERENCES Categories(Id),
	[Rating] decimal(5,1),
	[Notes] nvarchar(250)
);

INSERT INTO Movies(Title,CopyrightYear,[Length],[DirectorId],[GenreId],[CategoryId],[Rating],[Notes]) VALUES
('test','06.25.2002',150,1,1,1,7.1,NULL),
('1','06.25.2002',150,1,1,1,7.1,NULL),
('2','06.25.2002',150,1,1,1,7.1,NULL),
('3','06.25.2002',150,1,1,1,7.1,NULL),
('4','06.25.2002',150,1,1,1,7.1,NULL)

select * from Movies