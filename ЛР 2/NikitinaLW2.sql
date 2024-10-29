* 1. �������� ���� ������ "STUDENTS" */
CREATE DATABASE STUDENTS5

/* ������� � ���� ������ "STUDENTS" */
USE STUDENTS;

/* 2. �������� ������ */


/* a. �������� ������� "PersonalInfo" */
CREATE TABLE PersonalInfo (
  StudentID INT PRIMARY KEY,
  FirstName NVARCHAR(50),
  LastName NVARCHAR(50),
  DateOfBirth DATE
);


* b. �������� ������� "AcademicInfo" */
CREATE TABLE AcademicInfo5 (
  RecordID INT PRIMARY KEY,
  StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
  Faculty NVARCHAR(100),
  Curator NVARCHAR(100),
  EnrollmentYear INT
);


/* c. �������� ������� "ContactInfo" */
CREATE TABLE ContactInfo6 (
  ContactID INT PRIMARY KEY,
  StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
  Email NVARCHAR(100),
  PhoneNumber NVARCHAR(15) 
);

/* 3. �������� � �������� "ContactInfo" */


/* a. ���������� ������� "Address" */
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/* b. �������� ������� "PhoneNumber" */
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/* c. �������������� ������� "Email" � "EmailAddress" */
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/* 4. ��������� ���� ������ ������� "Faculty" � ������� "AcademicInfo" */
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150)

/* 5. �������� � �������� ������� "Extracurricular" */
CREATE TABLE Extracurricular (
 ActivityID INT PRIMARY KEY,
 StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
 ActivityName NVARCHAR(100),
 JoinDate DATE
);

/* �������� ������� "Extracurricular" */
DROP TABLE Extracurricular;

/* 6. �������� � �������� ���� ������ "TEACHER" */
CREATE DATABASE TEACHER;
 DROP DATABASE TEACHER;

 /* 7. ���������� ������ � ������� "PersonalInfo" */
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
(1, '���������', '������', '2000-05-15'),
(2, '����', '��������', '2001-03-22'),
(3, '������', '���������', '1999-10-10');