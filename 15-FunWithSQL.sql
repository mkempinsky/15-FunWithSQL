-- Incomplete( 9, 16)

-- 1.	Write a query to return all category names with their descriptions from the Categories table.
select CategoryName, [Description]
from Categories

-- 2.	Write a query to return the contact name, customer id, company name and city name of all Customers in London
select ContactName, CustomerID, CompanyName, City
from Customers
where City = 'London'

-- 3.	Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
select *
from Suppliers
where (ContactTitle= 'Marketing Manager'
OR ContactTitle= 'Sales Representative')
AND Fax IS NOT NULL

-- 4.	Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
select OrderID, RequiredDate, Freight
from Orders
where RequiredDate Between '1997-01-01 00:00:00:00' and '1997-12-31 00:00:00:00' AND Freight < 100


-- 5.	Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
select CompanyName, ContactName, Country 
from Customers
where Country IN('Mexico', 'Sweden', 'Germany')

-- 6.	Write a query to return a count of the number of discontinued products in the Products table.
select count(Discontinued)
from Products
where Discontinued != 0

-- 7.	Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
select CategoryName, [Description]
from Categories
where CategoryName like 'Co%'

-- 8.	Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
select CompanyName, City, Country, PostalCode
from Suppliers
where [Address] like '%rue%'
order by CompanyName asc

-- 9.	Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.


-- 10.	Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
select CompanyName, [Address], City, PostalCode, Country
from Customers INNER JOIN Orders
on Customers.CustomerID = Orders.CustomerID
where ShipVia = 1

-- 11.	Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
select CompanyName, ContactName, ContactTitle, Region.RegionDescription
from Suppliers INNER JOIN Region
on Suppliers.Region = Region.RegionID

-- 12.	Write a query to return all product names from the Products table that are condiments.
select Products.ProductName
from Products INNER JOIN Categories
on Products.CategoryID = Categories.CategoryID
where Categories.CategoryName = 'Condiments'


-- 13.	Write a query to return a list of customer names who have no orders in the Orders table.
select ContactName
from Customers LEFT OUTER JOIN Orders
on Customers.CustomerID = Orders.CustomerID
where OrderID IS NULL

-- 14.	Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
insert into Shippers (CompanyName)
values ('Amazon') 

-- 15.	Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
update Shippers
set CompanyName = 'Amazon Prime Shipping'
where CompanyName = 'Amazon'

-- 16.	Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
select CompanyName, cast(round(sum(Freight), 0) AS int) AS 'Freight Total' 
from Shippers LEFT JOIN Orders 
on Shippers.ShipperID = Orders.ShipVia
group by CompanyName
order by [Freight Total] desc

-- 17.	Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
select LastName+', '+FirstName AS DisplayName
from Employees

-- 18.	Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
insert into Customers (CustomerID, CompanyName, ContactName)
values ('MICH', 'OCA','Michele')
insert into Orders (CustomerID, ShipName)
values ('MICH', 'Grandma''s Boysenberry Spread')

-- 19.	Write a query to remove yourself and your order from the database.
delete from Customers
where CustomerID = 'MICH'
delete from Orders
where CustomerID = 'MICH'

-- 20.	Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
select ProductName, sum(UnitsInStock)
from Products
group by ProductName
having sum(UnitsInStock) > 100