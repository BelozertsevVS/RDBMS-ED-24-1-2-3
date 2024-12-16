USE [WebStor]



/* Задача 1

Напишіть запит, який поверне ідентифікатор клієнта (CUST_NUM) з найбільшим кредитним лімітом (CREDIT_LIMIT).

Враховуйте ймовірність того, що одразу кілька клієнтів можуть мати однаковий кредитний ліміт.

- Використовується таблиця [dbo].[CUSTOMERS]

- Не використовуйте оператор with ties

- Результативний набір даних містить: Ідентифікатор клієнта */


SELECT [CUST_NUM]
FROM [dbo].[CUSTOMERS]
WHERE [CREDIT_LIMIT] = (SELECT TOP 1 MAX([CREDIT_LIMIT]) FROM [dbo].[CUSTOMERS]);
 




/* Задача 2

Напишіть запит, що повертає список замовлень клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT).

Враховуйте ймовірність того, що одразу кілька клієнтів можуть мати однаковий кредитний ліміт.

- Використовується таблиці [dbo].[CUSTOMERS], [dbo].[ORDERS]

- Не використовуйте оператор with ties

- Результативний набір даних містить: Ідентифікатор клієнта */


SELECT [ORDER_NUM]
FROM [dbo].[CUSTOMERS] AS A INNER JOIN [dbo].[ORDERS] AS B
ON A.[CUST_NUM] = B.[CUST]
WHERE [CREDIT_LIMIT] = (SELECT TOP 1 ([CREDIT_LIMIT]) FROM [dbo].[CUSTOMERS]);




/* Задача 3

Напишіть запит, що повертає найновіше (за датою проведення ORDER_DATE) замовлення серед списку замовлень клієнта з найбільшим кредитним лімітом (CREDIT_LIMIT).

Враховуйте ймовірність того, що одразу кілька замовлень можуть мати однакову дату проведення.

Враховуйте ймовірність того, що одразу кілька клієнтів можуть мати однаковий кредитний ліміт. */


SELECT [ORDER_DATE]

FROM [dbo].[CUSTOMERS] AS A INNER JOIN [dbo].[ORDERS] AS B
ON A.[CUST_NUM] = B.[CUST]

WHERE A.[CREDIT_LIMIT] = (SELECT MAX([CREDIT_LIMIT]) FROM [dbo].[CUSTOMERS]) AND B.[ORDER_DATE] = (SELECT MAX(B1.[ORDER_DATE]) 
FROM [dbo].[ORDERS] AS A1 INNER JOIN [dbo].[ORDERS] AS B1
ON A.[CUST_NUM] = B1.[CUST] 
WHERE A.[CREDIT_LIMIT] = (SELECT MAX([CREDIT_LIMIT]) FROM [dbo].[CUSTOMERS]));