/* 1. ��������� ���� ����� "STUDENTS" */
CREATE DATABASE STUDENTS;
GO

/* �������� �� ���� ����� "STUDENTS" */
USE STUDENTS;
GO

/* 2. ��������� ������� */
/* a. ��������� ������� "PersonalInfo" */
CREATE TABLE PersonalInfo (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE
);
GO

/* b. ��������� ������� "AcademicInfo" */
CREATE TABLE AcademicInfo (
    RecordID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Faculty NVARCHAR(100),
    Curator NVARCHAR(100),
    EnrollmentYear INT
);
GO

/* c. ��������� ������� "ContactInfo" */
CREATE TABLE ContactInfo (
    ContactID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);
GO

/* 3. �������� � ���������� ������� "ContactInfo" */
/* a. ������� �������� "Address" */
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
GO

/* b. ������� �������� "PhoneNumber" */
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
GO

/* c. ����� ��'� ������� "Email" �� "EmailAddress" */
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
GO

/* 4. ������� ���� ����� ������� "Faculty" � ������� "AcademicInfo" �� NVARCHAR(150) */
ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150);
GO

/* 5. ������� ���� ������� "Extracurricular" */
CREATE TABLE Extracurricular (
    ActivityID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    ActivityName NVARCHAR(100),
    JoinDate DATE
);
GO

/* ������� ������� "Extracurricular" */
DROP TABLE Extracurricular;
GO

/* 6. ��������� ���� ����� "TEACHER" */
CREATE DATABASE TEACHER;
GO

/* �������������, �� ���� ����� ���� ��������, � ���� ������� �� */
DROP DATABASE TEACHER;
GO

/* 7. ������������ �� ������� ���� ����� "STUDENTS" */
USE STUDENTS;
GO

/* ������ ��� ����� ����� �� ������� "PersonalInfo" */
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES
(1, '���������', '������', '2000-05-15'),
(2, '����', '��������', '2001-03-22'),
(3, '������