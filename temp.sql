USE SalesLT;
UPDATE OrderHeader
SET ShippingDate = NULL
WHERE OrderID % 4 = 0;
GO