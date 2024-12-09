SELECT * FROM sql_practice2_db.orders;

-- 1. Write a query to retrieve all data from a table named employees

select * from employees;

-- 2. Fetch the name, age, and department columns from the employees table.

SELECT  name,age,department from employees;

-- 3. Retrieve all employees whose age is greater than 30.

select * from employees
where age>30;

-- 4. Find employees who work in the IT department and have a salary greater than 50000

select * from employees
where department='IT' and salary>50000;

-- 5. Get all employees who work in the HR department or are less than 25 years old.

select * from employees
where department='HR' OR age<25;


-- 6. Retrieve all employees who do not work in the Finance department

select * from employees
where department !='finance';

-- 7. Find employees whose names start with the letter 'A'.

select *from employees
where name like 'A%';

-- 8. Retrieve employees whose email addresses contain the domain gmail.com.

select * from employees
where email like '%@gmail.com';

-- 9. Fetch the names and salaries of employees sorted by salary in descending order.

select name,salary from employees
order by salary DESC;

-- 10. Retrieve the top 5 highest-paid employees.

select * from employees
order by salary DESC limit 5;

-- 11. Count the total number of employees in the employees table.

select count(*)
from employees;

-- 12. Write a query to find the minimum and maximum salaries in the employees table

select min(salary), max(salary)
from employees;

-- 13. Calculate the average salary of employees in each department

select department, avg(salary) as avgsalary
from employees
group by department;

-- 14. Find all employees who work in the IT department and have a salary greater than 
-- 60000 or have been with the company for more than 5 years

select * from employees
where department='IT' and (salary>6000 or year_at_company>5);

-- 16. Update the department of an employee with employee_id = 101 to Marketing

update employees set department='marketing'
where employee_id=101;

-- 17. Find all users who haven’t logged in for more than 30 days from a user_logs table.

select user_id,last_login from user_logs
where last_login<now()-interval 30 day;

-- 18. Write a query to fetch the top 3 products with the highest sales from a sales table.

SELECT product_id, sum(total_sales) as total_sales from sales
group by product_id
order by total_sales desc limit 3;

-- 19. Count the number of customers from each region in the customers table.

select region, count(*) as customer_count from customers
group by region;

-- 20. Retrieve all orders from the orders table where the shipped_date is later than the 
-- delivery_date

select * from orders
where shipped_date>delivery_date;

-- 21. Sort by Multiple Columns:
-- Retrieve employees sorted by department in ascending order and salary in descending 
-- order

select * from employees
order by department asc,salary desc;


-- 22. Fetch the highest-paid employee from each department.

with rankedemployees as(
select employee_id,department,salary, row_number() over(partition by department
order by salary desc) as ranked from employees
)
select employee_id,department,salary from rankedemployees
where ranked=1;

-- 23. Find all employees whose email addresses are NULL.

select * from employees
where email is NULL;


-- 24. Update the salary to 30000 for all employees whose current salary is NULL.

update employees set salary=30000
where salary is null;

-- 25. Count how many users are active and inactive from the user_activity table

select activity_status, count(*) as user_count from  user_activity
group by activity_status;


select * from user_activity
where activity_status in ('active','inactive');

-- 26. Using the orders table, calculate the total number of orders placed in the first quarter 
-- (January to March) of 2023 and 2024. Compare the results to analyze the growth or 
-- decline in order activity.

select year(order_date) as year,count(*) as total_orders from orders
where order_date between '2023-01-01' and '2023-03-31' or order_date between '2024-01-01' and '2024-03-31'
group by year(order_date)
order by year(order_date);

-- 27. Identify the customer who 1has made the most purchases.

select customer_id, count(*) as total_purchases from orders
group by customer_id
order by total_purchases desc limit 1;


-- 28. Find the product that has been purchased most frequently

select product_name, count(*) as purchase_count
from sales
group by product_name
order by purchases_count desc limit 1;

-- 29. Assign a rank to each employee based on their salary in descending order.

select employee_id,salary,rank()
over(order by salary desc) as salary_rank
from employees;

-
-- 30. Retrieve duplicate records from the orders table based on the customer_id and 
-- order_date
select customer_id, order_date,count(*) as duplicate_count from orders
group by customer_id,order_date
having count(*)>2;

