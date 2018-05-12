DECLARE @OrderID int = 0

-- Declare a custom error if the specified order doesn't exist
DECLARE @error VARCHAR(30) = 'Order #' + cast(@OrderID as VARCHAR) + ' does not exist';

IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
BEGIN
  THROW 50001, @error, 0;
END
ELSE
BEGIN
  DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @OrderID;;
  DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID;
END
