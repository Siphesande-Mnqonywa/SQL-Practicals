
-- Q1. Display all columns for all transactions.Expected output: All columns

Select * from `Sales_ds.sales_tbl`;

--Display only the Transaction ID, Date, and Customer ID for all records.Expected output: Transaction ID, Date, Customer ID

Select 'Transaction ID', Date,'Customer ID' from `Sales_ds.sales_tbl`;

--Q3. Display all the distinct product categories in the dataset.Expected output: Product Category

select distinct 'product categories' from `Sales_ds.sales_tbl`;

--Q4 Display all the distinct gender values in the dataset.Expected output: Gender

select distinct gender from `Sales_ds.sales_tbl`;

--Q5. Display all transactions where the Age is greater than 40.Expected output: All columns

select * from `Sales_ds.sales_tbl`
where age > 40;

--Q6. Display all transactions where the Price per Unit is between 100 and 500.Expected output: All columns

select * from `Sales_ds.sales_tbl`
where CAST(`price per unit` AS FLOAT64) between 10 and 500;

--Q7. Display all transactions where the Product Category is either 'Beauty' or 'Electronics'.Expected output: All columns

select * from `Sales_ds.sales_tbl`
where `product category` in ('Beauty','Eletronics');

--Q8Display all transactions where the Product Category is not 'Clothing'.Expected output: All columns

select * from `Sales_ds.sales_tbl`
where `product category` <> 'Clothing';

--Q9 Display all transactions where the Quantity is greater than or equal to 3.Expected output: All columns

select * from `Sales_ds.sales_tbl`
where cast(quantity as Int64) >= 3;

--Q10. Count the total number of transactions.Expected output: Total_Transactions

select count(*) as Total_Transactions from `Sales_ds.sales_tbl`;


--.Q11Find the average Age of customers.Expected output: Average_Age

select avg(cast(age as int64))as average_age from `Sales_ds.sales_tbl`;

--Q12. Find the total quantity of products sold.Expected output: Total_Quantity

select sum(cast(quantity as int64)) as Total_Quantity from `Sales_ds.sales_tbl`;

--Q13. Find the maximum Total Amount spent in a single transaction.Expected output: Max_Total_Amount


select max(safe_cast(`Total Amount` as float64)) as Max_Total_Amount from `Sales_ds.sales_tbl` ;

--Q14. Find the minimum Price per Unit in the dataset.Expected output: Min_Price_per_Unit

select min(safe_cast(`Price per Unit`as float64)) as Min_Price_per_Unit from `Sales_ds.sales_tbl`;

--Q15. Find the number of transactions per Product Category.Expected output: Product Category, Transaction_Count

select `product category`,count(*) as Transaction_Count from `Sales_ds.sales_tbl`
group by `product category` ;

--Q16. Find the total revenue (Total Amount) per gender.Expected output: Gender, Total_Revenue

select `gender`,sum(`total amount`) as Total_Revenue from `Sales_ds.sales_tbl`
group by `gender` ;

--Q17 Find the average Price per Unit per product category.Expected output: Product Category, Average_Price

select `product category`, avg(`price per unit`) as Average_Price
from `Sales_ds.sales_tbl` 
group by `product category`;


--Q18. Find the total revenue per product category where total revenue is greater than 10,000.Expected output: Product Category, Total_Revenue

select `product category`, avg(`price per unit`) as Average_Price
from `Sales_ds.sales_tbl` 
group by `product category`; 

--Q19. Find the average quantity per product category where the average is more than 2.Expected output: Product Category, Average_Quantity

select `product category`, avg(`quantity`) as Average_Quantity
from `Sales_ds.sales_tbl` 
group by `product category`
having Average_Quantity > 2; 


--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'.Expected output: Transaction ID, Total Amount, Spending_Level

select `Transaction ID`, `total amount`,
  case 
    when `total amount` >1000 then 'High'
    else 'Low'
  End as Spending_Level
from `Sales_ds.sales_tbl`;

--Q21. Display a new column called Age_Group that labels customers as:• 'Youth' if Age < 30• 'Adult' if Age is between 30 and 59• 'Senior' if Age >= 60 Expected output: Customer ID, Age, Age_Group

select `Customer ID`, `Age`,
  case 
    when age < 30 then 'Youth'
    when age  between 30 and 59 then 'Youth'
    else 'Senior'
  End as Spending_Level
from `Sales_ds.sales_tbl`
