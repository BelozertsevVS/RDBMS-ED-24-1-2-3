SELECT 
    EMPL_NUM AS [������������� ����������],
    NAME AS [��'� ����������],
    AGE AS [³�],
    TITLE AS [������]
FROM 
    [dbo].[SALESREPS]
WHERE 
    AGE > 45
ORDER BY 
    AGE DESC;

SELECT DISTINCT 
    MFR AS [������������� ���������],
    PRODUCT AS [������������� ������]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008;

SELECT TOP 1 WITH TIES
    REP AS [������������� ����������],
    COUNT(*) AS [ʳ������ ���������� ���������]
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008
GROUP BY 
    REP
ORDER BY 
    COUNT(*) DESC;