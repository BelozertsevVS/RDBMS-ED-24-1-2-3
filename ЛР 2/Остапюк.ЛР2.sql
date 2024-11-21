Create database students; /* створив базу даних students */
CREATE TABLE PersonalInfo(
StudentID INT PRIMARY KEY,
FirstName NVARCHAR(50),
lastName NVARCHAR(50),
DateOfBirth DATE
); /* створив таблицю, що містить 4 стовпці і StudentId ключовий*/
CREATE TABLE AcademicInfo(
RecordId INT PRIMARY KEY,
StudentId INT FOREIGN KEY REFERENCES PersonalInfo(StudentId),
Faculty NVARCHAR(100),
Curator NVARCHAR(100),
EnrollmentYear INT
); /* створив таблицю, що має перший стовпець RecordId ключовий і другий стовпець StudentId пов'язаний ключем з першою таблицею стовпцем StudentId*/
CREATE TABLE ContactInfo(
ContactId INT PRIMARY KEY,
StudentId INT FOREIGN KEY REFERENCES PersonalInfo(StudentId),
Email NVARCHAR(100),
PhoneNumber NVARCHAR(15)
); /* створив таблицю, що має другий стовпець StudentId пов'язаний з першою таблицею першим стовпцем StudentId і перший ключовий стовпець ContactId*/
ALTER TABLE ContactInfo ADD Address NVARCHAR(200); /* додав стовпець Address у третю таблицю*/
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber; /* видалив стовпець PhoneNimber третьої таблиці*/
EXEC sp_rename 'ContactInfo.Email','EmailAddress', 'COLUMN'; /*перейменував стовпець Email у EmailAddress*/
ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150); /* змінив кількість символів у стовпці Faculty на 150*/
CREATE TABLE Extracurricular (
ActivityId INT PRIMARY KEY,
StudentId INT FOREIGN KEY REFERENCES PersonalInfo(StudentId),
ActivityName NVARCHAR(100),
JoinDate DATE
); /*створив таблицю Extracurricular, де стовпець ActivityId ключовий, а StudentId відсилає до таблиці PersonalInfo стовпця StudentId */
DROP TABLE Extracurricular; /* видалив таблицю Extracurricular*/
CREATE DATABASE TEACHER; /* створив базу даних TEACHER*/
DROP DATABASE TEACHER; /* видалив базу данх YEACHER*/
USE students;
INSERT INTO PersonalInfo(StudentId, FirstName, LastName, DateOfBirth)
Values
(1, 'Олександр', 'Петров', '2000-05-15'),
(2, 'Марія','Іваненко', '2001-03-22'),
(3, 'Василь', 'Коваленко', '1999-10-10'); /* заповнив таблицю PersonalInfo даними */
SELECT *

FROM [dbo].[PersonalInfo];


