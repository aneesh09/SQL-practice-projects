CREATE DATABASE Window_funcs;
USE Window_funcs;
CREATE TABLE employees(
emp_no INT PRIMARY KEY auto_increment,
department VARCHAR(20),
Salary int
);
drop table employess; 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

SELECT 
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees;
    
 -- partition
 select 
 emp_no,
 department,
 salary,
 Avg(salary) OVER(partition by department) as dept_avg,
 AVG(salary) OVER() AS comapny_avg
 FROM employees;
 
 select 
 emp_no,
 department,
 salary,
 count(*) over(partition by department) as dept_avg
 from employees;
 
 select 
 emp_no,
 department,
 salary,
 sum(salary) OVER(partition by department) as dept_payroll,
 sum(salary)OVER() as total_payroll
 from employees;
 
 -- order by
 select 
 emp_no,
 department,
 salary,
 sum(salary) OVER(partition by  department ORDER BY salary)
 as rolling_dept_salary,
 SUM(salary) over(partition by department) as
 total_dept_salary
 from employees;
 
 select 
 emp_no,
 department,
 salary,
 MIN(salary) OVER(partition by department ORDER BY salary desc) as rolling_min
 from employees;
 
 -- RANK & DENSE RANK
 select
 emp_no,
 department,
 salary,
 row_number() over(partition by department order by salary desc) as dept_row_number,
 rank() over(partition by department order by salary desc) as dept_salary_rank,
 rank() over(order by salary desc) as overall_rank,
 dense_rank() over (order by salary Desc) as overall_dense_rank,
 row_number() over(order by salary desc) as overall_num from employees
 order by overall_rank;
 
 -- NTILE
 SELECT 
 emp_no,
 department,
 salary,
 ntile(4) over(partition by department order by salary desc) as dept_salary_quartile,
 ntile(4) over (order by salary desc) as salary_quartile
 from employees;
 
 -- FIRST values
 SELECT 
 emp_no,
 department,
 salary,
 first_value(emp_no) over(partition by department order by salary desc) as highest_paid_dept,
 first_value(emp_no) over(order by salary desc) as highest_paid_overall
 from employees;
 
 -- LEAD & LAG:-calculates difference in salary
 Select 
 emp_no,
 department,
 salary,
 salary-LAG(salary) OVER(order by salary DESC) as
 salary_diff
 from employees;

select
emp_no,
department,
salary,
salary-lead(salary) over(partition by department order by salary desc) as dept_salary_diff
from employees; 

select
emp_no,
department,
salary,
salary-lead(salary) over(partition by department order by salary desc) as dept_salary_diff1,
salary-LAG(salary) OVER(order by salary DESC) as salary_diff
from employees; 