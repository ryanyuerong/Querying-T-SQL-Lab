--1Use CHOOSE() and MONTH() to get the season in which each order was shipped from the Orders table. You should select the order ID, shipped date, and then the season aliased as ShippedSeason. You can copy and paste the below into your query.
--Be careful to filter out any NULL shipped dates.

SELECT  OrderID, ShippedDate, CHOOSE(MONTH(ShippedDate),'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter') as ShippedSeason
FROM DBO.ORDERS
WHERE ISNUMERIC(MONTH(ShippedDate))=1;


--2.Using the Suppliers table, select the company name and use a simple IIF expression to display 'outdated' if a company has a fax number, or 'modern' if it doesn't. Alias the result of the IIF expression to Status.

SELECT CompanyName,IIF(ISNUMERIC(ISNULL(Fax, 0))=0,'outdated','modern') as Status
From DBO.SUPPLIERS



--3.Select from the Customers, Orders, and Order Details tables. Note that you need to use [Order Details] since the table name contains whitespace.
--Use GROUP BY and ROLLUP() to get the total quantity ordered by all countries, while maintaining the total per country in your result set.
--Your first column should be the country, and the second column the total quantity ordered by that country, aliased as TotalQuantity.

SELECT c.Country, SUM(od.Quantity) as TotalQuantity 
FROM DBO.[ORDER DETAILS] as od 
JOIN DBO.ORDERS as o 
ON od.OrderID = o.OrderID 
JOIN DBO.CUSTOMERS as c 
ON c.CustomerID = o.CustomerID 
GROUP BY ROLLUP (c.Country) 
ORDER BY (TotalQuantity);



--4.From the Customers table, use GROUP BY to select the country, contact title, and count of that contact title aliased as Count, grouped by country and contact title (in that order).
--Then use CASE WHEN, GROUPING_ID(), and ROLLUP() to add a column called Legend, which shows one of two things:
--When the GROUPING_ID is 0, show '' (i.e., nothing)
--When the GROUPING_ID is 1, show Subtotal for << Country >>'
--Do not use ORDER BY to order your results.


