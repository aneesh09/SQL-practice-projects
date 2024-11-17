create database companies_db;
use companies_db;
-- 1. unique
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
insert into contacts(name,phone)
values('Billybob','87232490234');
-- insert values which would result in error:
insert into contacts(name,phone)
values('Homi','87232490234');
-- 2. check
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
);
-- 3 Named constraints 
CREATE TABLE users2 (
username Varchar(20) not null,
age int,
constraint age_not_negative check (age>=0)
);

-- checking whether it is palindrom or not
CREATE TABLE palindromes2(
word varchar(100),
constraint word_is_palindrome check(reverse(word)=word));
-- 4 multiple coloumns constraints
CREATE TABLE companies (
    Name VARCHAR(255) NOT NULL,
    address Varchar(255) not null,
    CONSTRAINT name_address UNIQUE (name , address)
);

create table houses (
purchase_price int not null,
sale_price int not null,
constraint sprice_gt_pprice check(sale_price>= 
purchase_price));
-- alter table:-ALTER TABLE changes the structure of a table.
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
-- ALTER TABLE DROPPING COLUMNS
ALTER table companies drop column phone;

-- 5. renaming columns using alter table
Rename Table  companies to supliers;
alter table  suppliers  Rename to comapnies;

alter table companies
RENAME COLUMN  name to Company_name; 

-- 6. modifying coloumns
desc companies;
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';
ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);
-- 7. alter table constraints
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
ALTER TABLE houses DROP CONSTRAINT positive_pprice;