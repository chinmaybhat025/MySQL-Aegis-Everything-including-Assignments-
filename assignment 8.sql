# 1.
select customerNumber,customerName ,country,avg(creditLimit) over(partition by country) from customers where 
creditLimit >(select avg(creditLimit) from customers );
# 2.
select officeCode,city,cume_dist() over(order by officeCode) from offices;
#3.c.	List customers whose representatives report to Mr. William Patterson, ranked based on their credit limit.
select customerName, rank() over (order by creditLimit) as 'rank' from customers
where salesRepEmployeeNumber  in (select employeeNumber from employees where reportsTo=1088) ;

#4.d.	Determine the customer with the highest credit limit.
select customerNumber,customerName,contactLastName,contactFirstName,creditLimit ,RANK() over(Order by creditLimit desc) from
customers limit 1;

#5.e.	What was the cost of the query for the previous question (d)? What will be the cost if the query is rewritten
# without using window function?
#There is not much difference between the cost both got executed in same time

#6. 
select customerNumber,customerName,contactLastName,contactFirstName,creditLimit,country ,Max(creditLimit) 
over(partition by country), MAX(creditLimit) over(partition by country order by creditLimit)  from customers
 where creditLimit in  (select Max(creditLimit) over (Partition by country) from customers) ;
 
 #7.g.	Generate a pivot data for all the product lines and the total quantity in stock for the different product scales
 select productCode,productName, productline,productScale,quantityInStock, sum(quantityInStock) 
over(partition by productScale) as 'product scale wise',sum(quantityInStock) over(partition by productLine)  as 'products in product line' 
from products;

#8. h.	Which orders where shipped later than the required date?
select * from orders where requiredDate<shippedDate;

#9. i.	How many orders did each customer place in 2003, 2004 and 2005?
select orderNumber,orderDate,customerNumber, count(year(orderDate)) over (partition by year(orderDate) order by year(orderDate)) as 
 'Number of orders',count(customerNumber) over(partition by customerNumber) as 'Number of Orders for a customer' from orders; 

#10.j.	What was the total credit limit and number of customers associated with each office?
select country, sum(creditLimit) over (partition by country),count(customerNumber) over(partition by country) 
from customers where country  in (select country from Offices);
