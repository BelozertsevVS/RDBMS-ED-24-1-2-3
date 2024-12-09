-- �������� 1 --

-- 1. ��������� ���� ���� ����� University
CREATE DATABASE University;

-- ������������ ���� �����
USE University;

-- 2. ��������� �������

-- ������� Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

-- ������� Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

-- 3. ���������� ������� ������

-- ��������� ������ � Students
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES
(1, 'John', 'Doe', '2022-09-01'),
(2, 'Jane', 'Smith', '2023-01-15'),
(3, 'Mark', 'Johnson', '2023-03-20');

-- ��������� ������ � Courses
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES
(101, 'Mathematics', 'Advanced mathematics course.', 3),
(102, 'Physics', 'Introduction to physics.', 4),
(103, 'Literature', 'Study of classic literature.', 2);

-- 4. ������ �����
SELECT * FROM Students;
SELECT * FROM Courses;

-- 5. ����������� �������

-- ��������� ������� Email �� Students
ALTER TABLE Students ADD Email VARCHAR(100);

-- ��������� ������� Department �� Courses
ALTER TABLE Courses ADD Department VARCHAR(100);
-- ���������� ������� � �������� � ������� Students
UPDATE Students
SET Email = CASE 
    WHEN StudentID = 1 THEN 'john.doe@example.com'
    WHEN StudentID = 2 THEN 'jane.smith@example.com'
    WHEN StudentID = 3 THEN 'mark.johnson@example.com'
    ELSE NULL
END;

-- ���������� ������� Department � ������� Courses
UPDATE Courses
SET Department = CASE 
    WHEN CourseID = 101 THEN 'Mathematics Department'
    WHEN CourseID = 102 THEN 'Physics Department'
    WHEN CourseID = 103 THEN 'Literature Department'
    ELSE NULL
END;

-- 6. ������ ����� ���� �����������
SELECT * FROM Students;
SELECT * FROM Courses;

-- 7. ��������� ���� ����� University
Use master;
DROP DATABASE University;

-- �������� 2 --

-- 1. ��������� ���� ���� ����� SHOP
CREATE DATABASE SHOP;

-- ������������ ���� �����
USE SHOP;

-- 2. ��������� ������� SALES
CREATE TABLE SALES (
    SALES_ORDER_ID BIGINT PRIMARY KEY,
    REVISION_NUMBER TINYINT,
    ORDER_DATE DATETIME,
    DUE_DATE DATE,
    SHIP_DATE DATE,
    ONLINE_ORDER_FLAG BIT,
    CUSTOMER_ID INT,
    SALES_PERSON_ID INT,
    TERRITORY_ID INT,
    SUB_TOTAL DECIMAL(19,4),
    TAX_AMT DECIMAL(10,4),
    FREIGHT DECIMAL(10,4),
    MODIFIED_DATE DATETIME
);

-- 3. �������� ����� �� ������� SALES
INSERT INTO SALES (SALES_ORDER_ID, REVISION_NUMBER, ORDER_DATE, DUE_DATE, SHIP_DATE, ONLINE_ORDER_FLAG,
                   CUSTOMER_ID, SALES_PERSON_ID, TERRITORY_ID, SUB_TOTAL, TAX_AMT, FREIGHT, MODIFIED_DATE)
VALUES
(43659, 11, '1753-01-01 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29825, 279, 5, 184590.1346, 1971.5149, 616.0984, '2011-06-07 00:00:00.000'),
(43660,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29672, 279, 5, 1294.2529, 124.2483, 38.8276, '2011-06-07 00:00:00.000'),
(43661,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29734, 282, 6, 32726.4786, 3153.7696, 985.553, '2011-06-07 00:00:00.000'),
(43662,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29994, 282, 6, 28832.5289, 2775.1646, 867.2389, '2011-06-07 00:00:00.000'),
(43663,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29565, 276, 4, 419.4589, 40.2681, 12.5838, '2011-06-07 00:00:00.000');

-- 4. ������ �����
SELECT * FROM SALES;

-- 5. ��������� ������� SALES
DROP TABLE SALES;

-- 6. ��������� ���� ����� SHOP
Use master;
DROP DATABASE SHOP;
