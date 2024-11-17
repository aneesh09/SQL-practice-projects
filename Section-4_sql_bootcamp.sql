show databases;
create database soap_store;
create database Dogapp;
create database petshop;
create database chicken_coop;
drop database chicken_coop;
drop database petshop;
use Dogapp;
select database();
create database petshop;
CREATE table dogs(
name  varchar(50),
breed VARCHAR(50),
age INT
);
DESC dogs;
CREATE table cats(
name  varchar(50),
age INT
);
DESC cats;
use petshop;
insert into cats (name,age)
VALUES ('BLUE STEELE',5);
insert into cats (name,age)
VALUES ('JENKINS',7);
select * from cats;
drop table cats;

CREATE table pasteries(
name varchar(50),
quantity int);
DESC pasteries;
drop table pasteries;
show tables;
-- to list all tables in DB
-- show tables;
insert into cats(age,name)
Values
(23,'beth');
insert into cats(name,age)
values
   ('Meatball',5),
   ('Turkey',2),
   ('potatoface',3);
select*from cats;

CREATE table people(
first_name  varchar(20),
last_name VARCHAR(20),
age INT
);
Insert into people(first_name,last_name,age)
values
    ('Linda','Belcher',45),
    ('Philip','Frond',38),
    ('calvin','Fischoeder',70);
select*from people;
DESC cats;
create  table cats2(
   name VARCHAR(100) NOT NULL,
   age INT NOT NULL
   );
create table cats3(
	name varchar(20) default'no name provided',
    age INT default 100
);
DESC cats3;
insert into cats3(age) values(13);
insert into cats3() values();
create table cats4(
	name VARCHAR(20) NOT NULL DEFAULT'UNMAMED',
    age INT NOT NULL default 99
    );
    DESC cats4;
create table unique_cats(
     cat_id INT PRIMARY KEY,
     name_n varchar(100) NOT NULL,
     age INT NOT NULL
     );
DESC unique_cats;
create table unique_cats3(
cat_id INT auto_increment,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
primary key(cat_id)
);
DESC unique_cats3;
create table employees(
id INT auto_increment,
primary key(id),
first_name varchar(100) NOT NULL,
last_name varchar(100) NOT NULL,
middle_name varchar(100),
age int NOT NULL,
Current_status varchar(100) NOT NULL
DEFAULT 'employed'
);
DESC employees;


     
     