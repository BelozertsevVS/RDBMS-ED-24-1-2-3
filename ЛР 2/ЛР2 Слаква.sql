CREATE DATABASE Students;
    CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE )
		INSERT INTO PersonalInfo VALUES(1, 'Олександр', 'Петров', '2000-05-15')
	    INSERT INTO PersonalInfo VALUES(2, 'Марія', 'Іваненко', '2001-03-22')
	    INSERT INTO PersonalInfo VALUES(3, 'Василь', 'Коваленко', '1999-10-10');
	CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(150),
        Curator NVARCHAR(100),
        EnrollmentYear INT )
    CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        EmailAddress NVARCHAR(100),
	    Address NVARCHAR(200) )
