--1. Get the order ID and unit price for each order by joining the Orders table and the Order Details table.
--Note that you need to use [Order Details] since the table name contains whitespace.

SELECT o.OrderID, od.UnitPrice
FROM DBO.ORDERS AS o
JOIN DBO.[Order Details] AS od
ON o.OrderID = od.OrderID;

--2. Get the order ID and first name of the associated employee by joining the Orders and Employees tables.

SELECT o.OrderID, e.FirstName
FROM DBO.ORDERS AS o
JOIN DBO.EMPLOYEES AS e
ON o.EmployeeID = e.EmployeeID;

--3. Get the employee ID and related territory description for each territory an employee is in, by joining the Employees, EmployeeTerritories and Territories tables.

SELECT e.EmployeeID, t.TerritoryDescription
FROM DBO.EMPLOYEES AS e
JOIN DBO.EMPLOYEETERRITORIES AS et
ON e.EmployeeID = et.EmployeeID
JOIN DBO.TERRITORIES AS t
ON t.TerritoryID = et.TerritoryID;

--4. Select all the different countries from the Customers table and the Suppliers table using UNION.

SELECT Country
FROM DBO.CUSTOMERS
UNION
SELECT Country
FROM DBO.SUPPLIERS;

--5. Select all the countries, including duplicates, from the Customers table and the Suppliers table using UNION ALL.

SELECT Country
FROM DBO.CUSTOMERS
UNION ALL
Select Country
FROM DBO.SUPPLIERS;

--6. Using the Products table, get the unit price of each product, rounded to the nearest dollar.

SELECT ROUND(UnitPrice, 0)
FROM DBO.PRODUCTS;

--7. Using the Products table, get the total number of units in stock across all products.

SELECT SUM(UnitsInStock)
FROM DBO.PRODUCTS;

--8. Using the Orders table, get the order ID and year of the order by using YEAR(). Alias the year as OrderYear.

SELECT OrderID, YEAR(OrderDate) AS OrderYear
FROM DBO.ORDERS;

--9. Using the Orders table, get the order ID and month of the order by using DATENAME(). Alias the month as OrderMonth.

SELECT OrderID, DATENAME(month, OrderDate) AS OrderMonth 
FROM DBO.ORDERS;

--10. Use LEFT() to get the first two letters of each region description from the Region table.

SELECT LEFT(RegionDescription, 2)
FROM DBO.REGION;

--11. Using the Suppliers table, select the city and postal code for each supplier, using WHERE and ISNUMERIC() to select only those postal codes which have no letters in them.

SELECT City, PostalCode
FROM DBO.SUPPLIERS
WHERE ISNUMERIC(PostalCode) = 1;

--12. Use LEFT() and UPPER() to get the first letter (capitalized) of each region description from the Region table.

SELECT UPPER(LEFT(RegionDescription, 1))
FROM DBO.REGION
