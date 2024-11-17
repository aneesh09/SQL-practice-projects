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