CREATE DATABASE University2;
USE University2;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES (1, 'Ivan', 'Ivanov', '2020-09-01'),
       (2, 'Petro', 'Petrov', '2019-09-01'),
       (3, 'Anna', 'Kovalenko', '2021-09-01');

SELECT * FROM Students;
SELECT * FROM Courses;

ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Courses ADD Department VARCHAR(50);

SELECT * FROM Students;
SELECT * FROM Courses;

DROP DATABASE University2;










