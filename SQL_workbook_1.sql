
USE WideWorldImporters;


--1) How many stock items in the warehouse have a quantity on hand below the reorder level?--[Warehouse].[StockItemHoldings]

select COUNT(*) 
from [Warehouse].[StockItemHoldings]
where QuantityOnHand < ReorderLevel;

------------------------------------------------------------------------------------
--2) How many orders have been placed on 26th June 2015?
--[sales].[Orders]

select COUNT(*) 
from [sales].[Orders]
where OrderDate = '2015-06-26';

------------------------------------------------------------------------------------
--2. What is the total transaction amount done by the client whose CustomerID is 1?
--[Sales].[CustomerTransactions]

select SUM(TransactionAmount) 
from [Sales].[CustomerTransactions]
where CustomerID = 1;

------------------------------------------------------------------------------------
--3. How many unique secondary postal address lines are there?
--[Sales].[Customers]

select COUNT(DISTINCT(PostalAddressLine2))
from [Sales].[Customers];

------------------------------------------------------------------------------------
--4. What is the avg tax amount given by each customer?
--[Sales].[CustomerTransactions]
select *from [Sales].[CustomerTransactions]

select CustomerID, AVG(TaxAmount) as AVG_TaxAmount
from [Sales].[CustomerTransactions]
group by(CustomerID)
order by CustomerID ASC

------------------------------------------------------------------------------------
--5. Display all the details of the stockItemID "10", last edited from 1st January
--2013 to 31st December 2013.
--[Sales].[InvoiceLines]
select *from [Sales].[InvoiceLines]

select *
from [Sales].[InvoiceLines]
where StockItemID = 10
and LastEditedWhen between '2013-01-01' and '2013-12-31'

------------------------------------------------------------------------------------
--6. Display the average unit price of all the stockitemID where the average line
--proﬁt exceeds more than 150.
--[Sales].[InvoiceLines]
select * from [Sales].[InvoiceLines]

select StockItemID,AVG(UnitPrice) as AVG_UnitPrice
from [Sales].[InvoiceLines]
where LineProfit > 150
group by(StockItemID)

------------------------------------------------------------------------------------
--7. Provide the complete address to the client by integrating the line 1, line 2 of
--DeliveryAddress and PostalAddress.
--[Sales].[Customers]
select * from [Sales].[Customers]

select  DeliveryAddressLine1+','+DeliveryAddressLine2+','+PostalAddressLine1+','+ 
PostalAddressLine2 as address
from [Sales].[Customers]

------------------------------------------------------------------------------------
--8. Fetch all the records for the stock item name starting with USB.
--[Warehouse].[StockItems]
select * from [Warehouse].[StockItems]

select * 
from [Warehouse].[StockItems]
where StockItemName like 'USB%'

------------------------------------------------------------------------------------
--9. Calculate the Sales (product of quantity and unit price) sold when picking
--complete is 1st January 2013.
--[Sales].[OrderLines]

select * from [Sales].[OrderLines]

select Quantity*UnitPrice as Sales
from [Sales].[OrderLines]
where PickingCompletedWhen = '2013-01-01 11:00:00.0000000';

------------------------------------------------------------------------------------
--10. Round off the transaction amount to the nearest integer value.
--[Sales].[CustomerTransactions]

select * from [Sales].[CustomerTransactions]

select FLOOR(TransactionAmount)as TransactionAmount
from [Sales].[CustomerTransactions]

------------------------------------------------------------------------------------
--11. Who are the top 10 customers with the highest total purchase amount?
--[Sales].[Customers], [Sales].[Orders], [Sales].[OrderLines]



------------------------------------------------------------------------------------
--12. What is the total transaction amount for each year?
--[Sales].[CustomerTransactions]
select * from [Sales].[CustomerTransactions]

select YEAR(TransactionDate)as year,SUM(TransactionAmount) as annual_Amount
from [Sales].[CustomerTransactions]
group by (YEAR(TransactionDate))
