﻿SELECT DISTINCT MFR
FROM dbo.ORDERS 
INNER JOIN dbo.CUSTOMERS ON CUST_NUM = CUST_NUM
WHERE COMPANY LIKE '%CORP%'
  AND YEAR(ORDER_DATE) = 2008;

SELECT 
    CUST_NUM AS CUST_NUM,
    MONTH(ORDER_DATE) AS ORDER_DATE,
    COUNT(DISTINCT ORDER_NUM) AS QTY
FROM 
    dbo.CUSTOMERS C
LEFT JOIN 
    dbo.ORDERS O ON CUST_NUM = CUST_NUM 
                 AND YEAR(ORDER_DATE) = 2008
WHERE 
    COMPANY LIKE '%CORP%'
GROUP BY 
    CUST_NUM, MONTH(ORDER_DATE)
ORDER BY 
    QTY DESC;

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