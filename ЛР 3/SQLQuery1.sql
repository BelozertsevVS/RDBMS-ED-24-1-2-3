CREATE DATABASE University;
USE University;
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
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
(1, 'Aleksandr', 'Aleksandrovich', '2024-09-01'),
(2, 'Petro', 'Olegovich', '2024-01-15'),
(3, 'Oksana', 'Shevchenko', '2024-03-10');
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
(101, 'Mathematics', 'Basic concepts of algebra and calculus', 3),
(102, 'Physics', 'Introduction to classical mechanics', 4),
(103, 'Programming', 'Fundamentals of programming in Python', 5);
SELECT * FROM Students;
SELECT * FROM Courses;
ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Courses ADD Department VARCHAR(100);
SELECT * FROM Students;
SELECT * FROM Courses;
DROP DATABASE University;


