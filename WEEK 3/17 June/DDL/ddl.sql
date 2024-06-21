-- Create Database
CREATE DATABASE CorporateDB;

-- Use the Database
USE CorporateDB;

-- Create Table Employees
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    JoinDate DATE
);

-- Create Table Departments
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(50)
);

-- Create Table Projects
CREATE TABLE Initiatives (
    InitiativeID INT PRIMARY KEY,
    InitiativeName VARCHAR(100),
    CommenceDate DATE,
    FinishDate DATE
);

-- Create Table EmployeeProjects
CREATE TABLE StaffInitiatives (
    StaffID INT,
    InitiativeID INT,
    HoursLogged INT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (InitiativeID) REFERENCES Initiatives(InitiativeID)
);

-- Add Column to Employees
ALTER TABLE Staff
ADD ContactEmail VARCHAR(100);

-- Modify Column in Employees
ALTER TABLE Staff
MODIFY ContactEmail VARCHAR(150);

-- Drop Column from Employees
ALTER TABLE Staff
DROP COLUMN ContactEmail;

-- Rename Table
ALTER TABLE StaffInitiatives
RENAME TO EmployeeInitiatives;

-- Create Index
CREATE INDEX idx_lastname
ON Staff (LastName);

-- Drop Index
DROP INDEX idx_lastname
ON Staff;
