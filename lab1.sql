USE SalesLT;
--PROBLEM 1
SELECT * FROM Customer;

--PROBLEM 2 Display Full Customer Name
SELECT 
 CASE title 
 WHEN '' THEN ''
 WHEN NULL THEN ''
 ELSE title + ' '
 END
 + firstName + 
 CASE middleName
 WHEN '' THEN ''
 WHEN NULL THEN ''
  ELSE ' ' + middleName
 END
+ ' ' + lastName + 
 CASE WHEN suffix IS NOT NULL
  THEN ' ' + suffix
  ELSE ''
 END
AS Name
FROM Customer;

--PROBLEM 3 Display Salesperson, Greeting Name, PhoneNumber
SELECT salesperson AS Salesperson, 
	CASE title 
	WHEN '' THEN firstName + ' '
	WHEN NULL THEN firstName + ' '
	ELSE title + ' '
	END
	+
	lastName
	AS CustomerName, phoneNumber AS PhoneNumber
FROM Customer;

--PROBLEM 4 Display list of customerID:CompanyName
SELECT CONVERT(VARCHAR, customerID) + ":" + ISNULL(companyName, "N/A") AS CustomerList
FROM Customer;

--PROBLEM 5 Display SalesOrder and Date
SELECT SalesOrderNumber+'('+TRIM(STR(RevisionNumber)) +')' AS SalesOrderRevision, ISNULL( CONVERT(varchar, ShippingDate, 102),'N/A')
FROM OrderHeader;

--PROBLEM 6 Display list of customer names
SELECT firstName + ' ' + ISNULL(middleName, '') + 
  CASE WHEN NULLIF(middleName, '') IS NOT NULL THEN ' '
  ELSE ''
  END
  + lastName AS CustomerName
FROM Customer; 

--PROBLEM 7 Retrieve primary contacts
SELECT STR(customerID) AS CustomerID, COALESCE(emailAddress, phoneNumber) AS PrimaryContact
FROM Customer;

--PROBLEM 8 OrderIDs
SELECT STR(OrderID) AS OrderID, CASE 
  WHEN ShippingDate IS NOT NULL THEN 'Shipped'
  ELSE 'Awaiting Shipment' 
  END AS ShippingStatus
FROM OrderHeader;