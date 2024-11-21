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
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES
(1, 'Andriy', 'Yarmolenko', '2022-09-01'),
(2, 'Valeriy', 'Petrenko', '2023-02-15'),
(3, 'Olena', 'Kovalenko', '2021-11-30'); 
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES
(101, 'Mathematics', 'Basic course in Mathematics', 4),
(102, 'History', 'World History from ancient to modern times', 3),
(103, 'Programming', 'Introduction to programming with Python', 5); 
ALTER TABLE Students
ADD Email VARCHAR(100); 
ALTER TABLE Courses
ADD Department VARCHAR(100); 
SELECT * FROM Students; 
SELECT * FROM Courses; 

