USE WebStor;

SELECT DISTINCT 
    MFR,
    PRODUCT
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008;

-- �������� 1: ������ ���������� ������ 45 ����, ������������ �� ���� (���������)
SELECT 
    SALESREP_ID AS EmployeeID,
    NAME AS EmployeeName,
    AGE,POSITION
FROM [dbo].[SALESREPS]
WHERE AGE > 45
ORDER BY AGE DESC;

-- �������� 2: ������� ��������� MFR �� PRODUCT ��� ��������� 2008 ����
SELECT DISTINCT 
    MFR,
    PRODUCT
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008;

-- �������� 3: ���������(�) � ��������� ������� ���������� ��������� � 2008 ����
SELECT TOP 1 WITH TIES
    REP AS EmployeeID,
    COUNT(*) AS OrderCount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) = 2008
GROUP BY REP
ORDER BY COUNT(*) DESC;


