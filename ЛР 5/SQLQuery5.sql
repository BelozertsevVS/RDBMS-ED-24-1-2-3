USE WebStor;

SELECT DISTINCT 
    MFR,
    PRODUCT
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008;

-- Завдання 1: Список працівників старше 45 років, відсортованих за віком (спаданням)
SELECT 
    SALESREP_ID AS EmployeeID,
    NAME AS EmployeeName,
    AGE,POSITION
FROM [dbo].[SALESREPS]
WHERE AGE > 45
ORDER BY AGE DESC;

-- Завдання 2: Унікальні комбінації MFR та PRODUCT для замовлень 2008 року
SELECT DISTINCT 
    MFR,
    PRODUCT
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008;

-- Завдання 3: Працівник(и) з найбільшою кількістю проведених замовлень у 2008 році
SELECT TOP 1 WITH TIES
    REP AS EmployeeID,
    COUNT(*) AS OrderCount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008
GROUP BY REP
ORDER BY COUNT(*) DESC;


