-- Use the Database
USE CorporateDB;

-- Insert into Employees
INSERT INTO Staff (StaffID, FirstName, LastName, BirthDate, JoinDate)
VALUES (1, 'Alice', 'Johnson', '1985-05-15', '2011-06-01');

-- Insert into Departments
INSERT INTO Teams (TeamID, TeamName)
VALUES (1, 'Finance');

-- Insert into Projects
INSERT INTO Initiatives (InitiativeID, InitiativeName, CommenceDate, FinishDate)
VALUES (1, 'Initiative Beta', '2023-02-01', '2023-11-30');

-- Insert Multiple Rows into Employees
INSERT INTO Staff (StaffID, FirstName, LastName, BirthDate, JoinDate)
VALUES 
(2, 'Bob', 'Williams', '1992-07-20', '2013-09-15'),
(3, 'Catherine', 'Miller', '1983-12-05', '2006-10-01');

-- Update Employee Record
UPDATE Staff
SET LastName = 'Thompson'
WHERE StaffID = 1;

-- Delete Employee Record
DELETE FROM Staff
WHERE StaffID = 3;

-- Select All Employees
SELECT * FROM Staff;

-- Select Specific Columns
SELECT FirstName, LastName
FROM Staff;

-- Join Employees and Departments
SELECT s.FirstName, s.LastName, t.TeamName
FROM Staff s
JOIN Teams t ON s.StaffID = t.TeamID;

-- Insert into EmployeeProjects
INSERT INTO EmployeeInitiatives (StaffID, InitiativeID, HoursLogged)
VALUES (1, 1, 50);
