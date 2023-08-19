Use WideWorldImporters
/*

Q1) How many customers have made repeat purchases ?
--[Sales].[Orders]

Q2)  How many stock items in the warehouse have a quantity on hand below the reorder level?
–[Warehouse].[StockItemHoldings]

Q3) What is the total value of stock items held in the warehouse?
–[Warehouse].[StockItemHoldings] , [Warehouse].[StockItems]

Q4) What is the average quantity on hand for each stock item name in the warehouse?
--[Warehouse].[StockItemHoldings] , [Warehouse].[StockItems]

Q5) Which stock item has the highest quantity on hand in the warehouse?
–[Warehouse].[StockItemHoldings]

 Q6) What is the rank of each customer transaction based on the Amount transacted for each Transaction Type?
--[Sales].[CustomerTransactions] , [Application].[TransactionTypes]

Q7) Retrieve the total sales revenue for each year and month, as well as the grand total for all years and months.
--[Sales].[Orders] , [Sales].[OrderLines]

Q8)Display the detail of the orders received by customer on Each Date.
–[Sales].[Invoices]

Q9)Display the order details (order ID, customer name, order date) for all orders placed in the year 2015 and in the Month of May.
–[Sales].[Orders] , [Sales].[Customers]

Q10)  Start a transaction, update the amount of a supplier transaction where SupplierTransactionID is 12345, and rollback the transaction.
–[Purchasing].[SupplierTransactions]


*/
--1
select COUNT(Distinct(CustomerID))
as Repeat_Customers
from [Sales].[Orders]

--2
select COUNT(*) as Low_Stock
from [Warehouse].[StockItemHoldings]
where ReorderLevel > QuantityOnHand

--3
select SUM(si.UnitPrice*sh.QuantityOnHand) as Total_Value
from [Warehouse].[StockItems] as si
INNER JOIN [Warehouse].[StockItemHoldings] as sh
ON si.StockItemID = sh.StockItemID

--4
select si.StockItemName,FLOOR(AVG(si.UnitPrice*sh.QuantityOnHand)) as AVG_value
from [Warehouse].[StockItems] as si
INNER JOIN [Warehouse].[StockItemHoldings] as sh
ON si.StockItemID = sh.StockItemID
Group by (si.StockItemName)


--5
select TOP 1 StockItemID,QuantityOnHand
from [Warehouse].[StockItemHoldings]
order by QuantityOnHand DESC

--6
select RANK() OVER(PARTITION by tt.TransactionTypeName ORDER by ct.TransactionAmount DESC) as Rank,
ct.TransactionAmount, tt.TransactionTypeName
from [Sales].[CustomerTransactions] as ct 
INNER JOIN [Application].[TransactionTypes] as tt
ON ct.TransactionTypeID = tt.TransactionTypeID

--7
select SUM(ol.UnitPrice*ol.Quantity) as total_sales,
YEAR(OrderDate) as Year,
MONTH(OrderDate) as Month
from [Sales].[OrderLines] as ol
INNER JOIN [Sales].[Orders] as o
ON ol.OrderID = o.OrderID
Group by YEAR(OrderDate),MONTH(OrderDate)
With Rollup

--8
select OrderID,CustomerID,ConfirmedDeliveryTime
from [Sales].[Invoices]
Group by ConfirmedDeliveryTime,OrderID,CustomerID

--9
select o.OrderID,c.CustomerName,o.OrderDate
from [Sales].[Orders] as o 
INNER JOIN [Sales].[Customers] as c
ON o.CustomerID = c.CustomerID
where YEAR(OrderDate) = '2015'
and MONTH(OrderDate) = '05'

--10
BEGIN TRANSACTION

UPDATE [Purchasing].[SupplierTransactions]
SET TransactionAmount = 54000
WHERE SupplierTransactionID = '12345'

ROLLBACK TRANSACTION

