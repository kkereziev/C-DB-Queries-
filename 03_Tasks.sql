--1
SELECT FirstName,LastName FROM Employees
WHERE FirstName LIKE 'SA%'

--2
SELECT FirstName,LastName FROM Employees
WHERE LastName LIKE '%ei%'

--3
SELECT FirstName FROM Employees
WHERE DepartmentID IN (3,10) AND DATEPART(year,HireDate) BETWEEN 1995 AND 2005

--4
SELECT FirstName,LastName FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

--5
SELECT [Name] FROM Towns
WHERE LEN([Name]) IN (5,6)
ORDER BY [Name] ASC

--6
SELECT * FROM Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name] ASC

--7
SELECT * FROM Towns
WHERE [Name] LIKE '[^RBD]%'
ORDER BY [Name] ASC

--8
CREATE VIEW V_EmployeesHiredAfter2000
AS
SELECT FirstName,LastName FROM Employees
WHERE DATEPART(year,HireDate)>2000

--9
SELECT FirstName,LastName FROM Employees
WHERE LEN(LastName)=5

--10
SELECT EmployeeID,FirstName,LastName,Salary, DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC

--11
SELECT * FROM (SELECT EmployeeID,FirstName,LastName,Salary, 
	DENSE_RANK() 
	OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000) AS [Rank Table]
WHERE [Rank]=2
ORDER BY Salary DESC

--12
USE [Geography]
SELECT CountryName AS [Country Name],IsoCode AS [ISO Code] 
	FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode ASC

--13
SELECT p.PeakName,r.RiverName,
	LOWER(p.PeakName+SUBSTRING(r.RiverName,2,LEN(r.RiverName)-1)) AS [Mix] 
	FROM Peaks AS p,Rivers AS r
WHERE RIGHT(p.PeakName,1)=LEFT(r.RiverName,1)
ORDER BY [Mix]

--14
USE [Diablo]
SELECT TOP(50) [Name],FORMAT([Start],'yyyy-MM-dd') AS [Start] 
	FROM Games
WHERE DATEPART(YEAR,[Start]) IN (2011,2012)
ORDER BY [Start]

--15
SELECT Username, SUBSTRING(Email,CHARINDEX('@',Email,1)+1,LEN(Email)) 
AS 'Email Provider' 
FROM Users
ORDER BY [Email Provider], Username

--16
SELECT Username,IpAddress AS [IP Address] FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username

--17
SELECT [Name], 
CASE 
	WHEN DATEPART(HOUR,[Start]) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN DATEPART(HOUR,[Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
	ELSE 'Evening'
END AS [Part of the Day],
CASE
	WHEN Duration<=3 THEN 'Extra Short'
	WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
	WHEN Duration>6 THEN 'Long'
	ELSE 'Extra Long'
END AS [Duration]
FROM Games
ORDER BY [Name], Duration, [Part of the Day]

SELECT * FROM Games
