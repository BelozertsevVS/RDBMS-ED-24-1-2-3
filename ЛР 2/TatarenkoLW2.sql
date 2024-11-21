CREATE DATABASE STUDENTS

USE STUDENTS
/*
�������� 1
�������� 1
�������� 1
*/



-- �������� 1


-- �������� 2

CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY, -- �������� 2
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
    );

	CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );

	CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );
	
	/*
	ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

	ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

	EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
	
	--�������� 3
	ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);

   --�������� 4
   CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );

	DROP TABLE Extracurricular;

	--�������� 5
	CREATE DATABASE TEACHER;

	DROP DATABASE TEACHER;

	--�������� 6
	USE STUDENTS;

	INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, '���������', '������', '2000-05-15'),
    (2, '����', '��������', '2001-03-22'),
    (3, '������', '���������', '1999-10-10')









