﻿﻿USE WebStor

--Завдання 1--

SELECT DISTINCT O.MFR
FROM dbo.ORDERS O
INNER JOIN dbo.CUSTOMERS C ON O.REP = C.CUST_REP 
WHERE C.COMPANY LIKE '%CORP%'
  AND YEAR(O.ORDER_DATE) = 2008;

--Завдання 2--

SELECT 
    C.CUST_NUM,
    ISNULL(MONTH(O.ORDER_DATE), 0) AS ORDER_MONTH,
    COUNT(DISTINCT O.ORDER_NUM) AS UNIQUE_ORDERS
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O 
    ON C.CUST_REP = O.REP
    AND YEAR(O.ORDER_DATE) = 2008
    AND C.COMPANY LIKE '%CORP%'
GROUP BY 
    C.CUST_NUM,
    MONTH(O.ORDER_DATE)
ORDER BY 
    UNIQUE_ORDERS DESC;

--Завдання 3--

SELECT 
    C.CUST_NUM,
    UPPER(C.COMPANY) AS COMPANY_NAME,
    P.DESCRIPTION
FROM dbo.CUSTOMERS C
LEFT JOIN dbo.ORDERS O 
    ON C.CUST_REP = O.REP
    AND YEAR(O.ORDER_DATE) = 2008
    AND C.COMPANY LIKE '%CORP%'
LEFT JOIN dbo.PRODUCTS P 
    ON O.PRODUCT = P.PRODUCT_ID
GROUP BY 
    C.CUST_NUM,
    UPPER(C.COMPANY),
    P.DESCRIPTION;