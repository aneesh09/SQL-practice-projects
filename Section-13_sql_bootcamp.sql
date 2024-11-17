CREATE DATABASE SHOP;
USE  SHOP;
create table customers(
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_Name Varchar(50),
 last_Name Varchar(50),
 email Varchar(50)
 );
 create Table orders(
 id INT PRIMARY KEY auto_increment,
 Order_Date Date,
 amount decimal(8,2),
 customer_id INT,
 foreign key(customer_id) references customers(id)
 );
 insert into customers(first_Name,Last_name,email)
 VALUES ('Boy','George','george@gmail.com'),
        ('George','Micheal','gm@gmail.com'),
		('David','Bowie','david@gmail.com'),
        ('Blue','steele','blue@gmail.com'),
        ('Bette','Davis','bette@gmail.com');
 insert into orders(order_date,amount,customer_id)
 VALUES ('2016-02-10','99.99','1'),
        ('2017-11-11','35.50','1'),
		('2014-12-12','809.67','2'),
        ('2015-01-03','12.50','2'),
        ('1994-04-11','450.25','5');
select * from customers;
select * from orders;
--  cross joins
select id from customers where last_name='George';
select * from orders where customer_id=1;

select * from orders
where customer_id=(select id from customers where last_name='George');

select * from customers,orders;
-- inner joins
SELECT 
    *
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id;

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id;

SELECT 
    *
FROM
    orders
        JOIN
    customers ON customer_id = orders.customer_id;
-- inner joins
SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;
-- left join
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        LEFT JOIN
    orders ON orders.customer_id = customers.id;

SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;
-- left join with group by
SELECT 
    first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent
FROM
    customers
        LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;
-- right join
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;
-- foreign key
CREATE TABLE customers1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
); 

create table students (
 id INT PRIMARY KEY auto_increment,
 first_name VARCHAR(50)
 );
 
 create table papers(
 student_id INT,
 title VARCHAR(50),
 grade int,
 Foreign key (student_id) references students(id)
 );
 
 drop table papers;
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);
-- exercise
-- inner join
SELECT 
    first_name, title, grade
FROM
    students
        JOIN
    papers ON papers.student_id = students.id
ORDER BY grade DESC;
-- left join
SELECT 
    first_name, title, grade
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;
-- ifnull
SELECT 
    first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id;

SELECT 
    first_name, IFNULL(AVG(grade), 0) AS Average
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS PASSING_STATUS
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

