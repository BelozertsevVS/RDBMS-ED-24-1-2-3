USE WebStor;

CREATE TABLE SALESREPS (
    EMPLOYEE_ID INT PRIMARY KEY, 
    NAME NVARCHAR(50), 
    AGE INT, 
    POSITION NVARCHAR(50)
);

INSERT INTO SALESREPS (EMPLOYEE_ID, NAME, AGE, POSITION)
VALUES 
(1, 'Іван Петренко', 50, 'Менеджер'),
(2, 'Олена Сидорова', 46, 'Продавець'),
(3, 'Андрій Коваленко', 30, 'Продавець'),
(4, 'Марія Гнатюк', 55, 'Директор');

SELECT 
    EMPLOYEE_ID AS [Ідентифікатор працівника],
    NAME AS [Ім'я працівника],
    AGE AS [Вік],
    POSITION AS [Посада]
FROM 
    SALESREPS
WHERE 
    AGE > 45
ORDER BY 
    AGE DESC;

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY, 
    MFR NVARCHAR(50), 
    PRODUCT NVARCHAR(50), 
    ORDER_DATE DATE, 
    REP INT
);

INSERT INTO ORDERS (ORDER_ID, MFR, PRODUCT, ORDER_DATE, REP)
VALUES 
(1, 'MFR1', 'PRD1', '2008-01-15', 101),
(2, 'MFR2', 'PRD2', '2008-03-10', 102),
(3, 'MFR1', 'PRD3', '2008-07-25', 103),
(4, 'MFR2', 'PRD2', '2009-01-20', 104),
(5, 'MFR3', 'PRD1', '2008-05-05', 101),
(6, 'MFR1', 'PRD1', '2008-09-15', 102);


SELECT DISTINCT 
    MFR AS [Ідентифікатор виробника],
    PRODUCT AS [Ідентифікатор товару]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008;

SELECT TOP 1 WITH TIES 
    REP AS [Ідентифікатор працівника],
    COUNT(*) AS [Кількість проведених замовлень]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008
GROUP BY 
    REP
ORDER BY 
    COUNT(*) DESC;