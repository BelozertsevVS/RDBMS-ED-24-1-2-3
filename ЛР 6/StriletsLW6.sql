CREATE TABLE [dbo].[ORDERS] (
    ORDER_ID INT,
    ORDER_DATE DATE,
    MFR NVARCHAR(50),
    PRODUCT NVARCHAR(50),
    TOTAL_AMOUNT DECIMAL(10, 2)
);

-- Вставте тестові дані
INSERT INTO [dbo].[ORDERS] (ORDER_ID, ORDER_DATE, MFR, PRODUCT, TOTAL_AMOUNT)
VALUES
(1, '2007-12-25', 'MFR1', 'A100', 500.00),
(2, '2008-01-15', 'MFR2', 'B200', 300.00),
(3, '2009-05-10', 'MFR1', 'C0D', 700.00);

-- Задача 1: Список офісів східного регіону з ціллю по продажах <= 350000.00
SELECT 
    OFFICE_ID AS OfficeID,
    CITY AS City,
    MANAGER_ID AS ManagerID
FROM [dbo].[OFFICES]
WHERE REGION = 'East' AND TARGET_SALES <= 350000.00;

-- Задача 2.1: Список замовлень, які не були в 2008 році, товари з "A" другим символом або "0" у будь-якому місці
SELECT *
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');

-- Задача 2.2: Загальна сума замовлень по виробникам товарів
SELECT 
    MFR,
    COUNT(DISTINCT ORDER_ID) AS UniqueOrders,
    SUM(TOTAL_AMOUNT) AS TotalAmount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount ASC;

-- Задача 2.3: Виробник з найбільшою загальною сумою замовлень
SELECT TOP 1 WITH TIES
    MFR,
    SUM(TOTAL_AMOUNT) AS TotalAmount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount DESC;

-- Задача 3: Офіс з найбільшою кількістю працівників на посаді Sales Rep та віці 29, 45, 48
SELECT TOP 1 WITH TIES
    OFFICE_ID AS OfficeID,
    COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
WHERE POSITION = 'Sales Rep'
  AND AGE IN (29, 45, 48)
GROUP BY OFFICE_ID
ORDER BY EmployeeCount DESC;

-- Задача 4: Продукт з найбільшою довжиною опису
SELECT TOP 1 WITH TIES
    MFR_ID AS ManufacturerID,
    PRODUCT_ID AS ProductID,
    [DESCRIPTION],
    LEN([DESCRIPTION]) AS DescriptionLength
FROM [dbo].[PRODUCTS]
ORDER BY DescriptionLength DESC;

-- Задача 5: Продукти з ідентифікатором, що містить лише цифри, з конкатенацією
SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([DESCRIPTION])) AS ConcatenatedString,
    LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([DESCRIPTION]))) AS StringLength
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;

-- Задача 6: Клієнти з найменшим кредитним лімітом
SELECT 
    CUSTOMER_ID AS CustomerID,
    CONCAT(LEFT(CUSTOMER_NAME, 2), REPLICATE('*', LEN(CUSTOMER_NAME) - 4), RIGHT(CUSTOMER_NAME, 2)) AS ObfuscatedName,
    CREDIT_LIMIT
FROM [dbo].[CUSTOMERS]
WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS]);
