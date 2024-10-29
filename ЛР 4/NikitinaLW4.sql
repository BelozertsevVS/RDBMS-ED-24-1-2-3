-- �������� ���� ������ UniversityDB
CREATE DATABASE UniversityDB;

-- ������������� ���� ������ UniversityDB
USE UniversityDB;

-- �������� ������� Departments
CREATE TABLE Departments (
DepartmentID INT NOT NULL,
DepartmentName VARCHAR(100)
);

-- �������� ������� Professors
CREATE TABLE Professors (
ProfessorID INT NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age TINYINT,
DepartmentID INT,
Email VARCHAR(100)
);

-- ���������� ���������� ����� ��� ������� Departments
ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

-- ���������� ���������� ����� ��� ������� Professors
ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

-- ���������� ����������� ����������� �� ���� Email � ������� Professors
ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

-- ���������� �������� ����� ����� ��������� Professors � Departments
ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- ���������� ����������� �������� �������� ����������� (������� ������ ���� >= 20)
ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age >= 20);

-- ��������� ���� FirstName: ������ ��� �� ����� ���� NULL
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

-- ��������� ���� LastName: ������ ��� �� ����� ���� NULL
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

-- ���������� ����������� �� ��������� ��� ���� DepartmentName � ������� Departments (�������� �� ��������� � 'General')
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;
 
-- ����������� DEFAULT �������� 'General'
INSERT INTO Departments (DepartmentID) VALUES (1);

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (2, 'Jane', 'Doe', 35, 1, 'jane.doe@university.com');

-- �������� ������� Professors
DROP TABLE IF EXISTS Professors;

-- �������� ������� Departments
DROP TABLE IF EXISTS Departments;

-- �������� ���� ������ UniversityDB
DROP DATABASE UniversityDB;

-- �������� ���� ������ CompanyDB
CREATE DATABASE CompanyDB;

-- ������������� ���� ������ CompanyDB
USE CompanyDB;

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Email VARCHAR(100) UNIQUE, 
Position VARCHAR(50) DEFAULT 'Junior Developer'
);

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''), 
Budget DECIMAL(10, 2) CHECK (Budget > 0), 
DefaultRoomNumber INT DEFAULT 101
);

CREATE TABLE Assignments (
AssignmentID INT PRIMARY KEY, 
EmployeeID INT NOT NULL, 
DepartmentID INT NOT NULL, 
AssignmentDate DATETIME DEFAULT GETDATE(), 
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID), 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- ������� �����
INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
VALUES (1, 'Human Resources', 50000);

-- ������� ����������
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (1, 'John', 'Smith', 'john.smith@company.com');

-- ������� �����������
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (1, 1, 1);


SELECT * FROM Employees WHERE EmployeeID = 999;


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (999, 'New', 'Employee', 'new.employee@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (2, 999, 1);

DROP TABLE IF EXISTS Assignments;  
DROP TABLE IF EXISTS Employees;     
DROP TABLE IF EXISTS Departments;    

ALTER DATABASE CompanyDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE CompanyDB;



