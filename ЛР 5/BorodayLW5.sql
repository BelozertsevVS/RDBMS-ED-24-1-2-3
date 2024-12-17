SELECT 
    EMPL_NUM AS [Ідентифікатор працівника],
    NAME AS [Ім'я працівника],
    AGE AS [Вік],
    TITLE AS [Посада]
FROM 
    [dbo].[SALESREPS]
WHERE 
    AGE > 45
ORDER BY 
    AGE DESC;

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