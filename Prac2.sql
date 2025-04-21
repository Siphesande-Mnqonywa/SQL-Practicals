--1. INNER JOIN: Orders with Customer and Product Names Question:List all orders along with the customer name and product name.Expected Output Columns:• OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT 
  A.OrderID, 
  A.OrderDate, 
  B.CustomerName, 
  C.ProductName, 
  A.Quantity
FROM `Sales_ds.orders_large` AS A
INNER JOIN `Sales_ds.customers` AS B 
  ON A.CustomerID = B.CustomerID
INNER JOIN `Sales_ds.products_large` AS C 
  ON A.ProductID = C.ProductID;
--2. INNER JOIN: Customers Who Placed OrdersQuestion:Which customers have placed at least one order?Expected Output Columns:CustomerID, CustomerName, Country, OrderID, OrderDate

select B.CustomerID, B.CustomerName,B.Country, A.OrderID, A.OrderDate

from `Sales_ds.orders_large` as A
inner join `Sales_ds.customers` as B on
A.CustomerID =B.customerID;


--3. LEFT JOIN: All Customers and Their OrdersQuestion:List all customers and any orders they might have placed. Include customers who have not placed any orders.Expected Output Columns:• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity


select A.CustomerID, A.Country, OrderID, OrderDate, ProductID, Quantity from `Sales_ds.customers` as A left join `Sales_ds.orders_large` as B on A.CustomerID =B.CustomerID;

--4. LEFT JOIN: Product Order Count Question:List all products and how many times each was ordered (if any).Expected Output Columns:• ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

select A.ProductID, ProductName, count(*) as TotalOrders

from `Sales_ds.orders_large` as A
left join `Sales_ds.products_large` as B 
on A.ProductID = B.ProductID
group by ALL;

--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)Question:Find all orders along with product details, including any products that might not have been ordered.Expected Output Columns:OrderID, OrderDate, ProductID, ProductName, Price, Quantity

select A.OrderID, OrderDate, B.ProductID, ProductName, Price, Quantity
from `Sales_ds.orders_large` as A right join
`Sales_ds.products_large` as B on A.ProductID = B.ProductID;

--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)Question:Which customers have made orders, and include customers even if they have never placed an order.Expected Output Columns:CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select B.CustomerID, CustomerName, Country, A.OrderID, OrderDate, ProductID, Quantity
from `Sales_ds.orders_large` as A
right join `Sales_ds.customers` as B on A.CustomerID = B.CustomerID
;

 --7 FULL OUTER JOIN: All Customers and All Orders Question:List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.Expected Output Columns:CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select B.CustomerID, CustomerName, Country, A.OrderID, OrderDate, ProductID, Quantity
from `Sales_ds.orders_large` as A 
full outer join `Sales_ds.customers`as B on A.CustomerID = B.CustomerID;


--8. FULL OUTER JOIN: All Products and OrdersQuestion:List all products and orders, showing NULLs where products were never ordered or orders are missing product info.Expected Output Columns:ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

select B.ProductID, ProductName, Price, A.OrderID, OrderDate, CustomerID, Quantity

from `Sales_ds.orders_large`as A full outer join 
`Sales_ds.products_large`as B  on 
A.ProductID = B.ProductID