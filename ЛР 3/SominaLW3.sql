CREATE DATABASE University;
USE University;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT);
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
(1, '���������', '��������', '2022-09-01'),
(2, '����', '���������', '2022-09-02'),
(3, '�����', '��������', '2022-09-03');
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
(1, '����������', '������ ����������', 3),
(2, 'Գ����', '������ ������', 4),
(3, '�������������', '����� �� �������������', 5);
SELECT * FROM Students;
SELECT * FROM Courses;
ALTER TABLE Students
ADD Email VARCHAR(100);
ALTER TABLE Courses
ADD Department VARCHAR(50);
SELECT * FROM Students;
SELECT * FROM Courses;
DROP DATABASE University;
