DECLARE @___ datetime = GETDATE();
DECLARE @___ datetime = DATEADD(dd, 7, GETDATE());
DECLARE @___ int = 1;

INSERT INTO SalesLT.SalesOrderHeader (OrderDate, ___, ___, ShipMethod)
VALUES (@OrderDate, @DueDate, @CustomerID, ___);

PRINT SCOPE_IDENTITY();
