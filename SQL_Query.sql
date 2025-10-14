USE CustomerDB;

CREATE TABLE dbo.Customers (
    InvoiceNo VARCHAR(20),
    InvoiceDate DATETIME,
    CustomerID INT NULL,
    Country VARCHAR(50),
    Quantity INT,
    Amount VARCHAR(50) 
);

BULK INSERT Customers
FROM 'C:\Users\ic\Desktop\RFM\sales_per_invoice.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

Select @@SERVERNAME;