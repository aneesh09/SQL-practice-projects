-- 1.char vs varchar
-- The length of a CHAR column is fixed to the 
-- length that you declare when you create the table. 
-- The length can be any value from 0 to 255. 
-- When CHAR values are stored, they are right-padded 
-- with spaces to the specified length. When CHAR 
-- values are retrieved, trailing spaces are removed 
-- unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.
-- CHAR has a fixed length
-- Char(3) -> Only 3 Characters "Allowed"
-- CHAR is faster for fixed length text
create database practice;
use practice;
CREATE TABLE friends (
    name VARCHAR(10)
);
insert into friends (name) values ('tom'),('juan pablo'),('james');
SELECT 
    *
FROM
    friends;
CREATE TABLE states (
    abbr CHAR(2)
);
insert into states(abbr) values ('CA'),('NY');
SELECT * from states;
desc states;
insert into states(abbr) values ('x');
SELECT * from states;
insert into states(abbr) values ('ohio');
insert into friends (name) values ('qfqfwqfewgweg'),('fwefewfrqqf'),('qgqgkqglqjg');
-- numbers
-- tinyint,smallint,medium int,bigint
create table parent (children Tinyint);
use practice;
insert into parent(children) values (2),(7),(0);
insert into parent(children) values (1000),(7000),(2340);
insert into parent(children) values (-2);
-- decimal
insert into parent(children) values (-2.5);
insert into parent(children) values (90.242);
select * from parent;
create Table products(price decimal(5,2));
insert into products(price) values(4.56);
insert into products(price) values(5.56);
insert into products(price) values(678.56);
insert into products(price) values(113.334);
select * from products;
show warnings;
-- float:-Store larger numbers using less space
-- It comes at the cost of precision
create table nums(x float,y double);
insert into nums(x,y) values(1.324423,1.24243445);
select * from nums;
-- DATE & TIMES
CREATE TABLE PEOPLE (
    NAME VARCHAR(100),
    BIRTHDATE DATE,
    BIRTHTIME TIME,
    BIRTHDT DATETIME
);

DESC PEOPLE;
INSERT INTO PEOPLE(NAME,BIRTHDATE,BIRTHTIME,BIRTHDT)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
INSERT INTO PEOPLE(NAME,BIRTHDATE,BIRTHTIME,BIRTHDT)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
INSERT INTO PEOPLE(NAME,BIRTHDATE,BIRTHTIME,BIRTHDT)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
INSERT INTO PEOPLE(NAME,BIRTHDATE,BIRTHTIME,BIRTHDT)
VALUES ('Hazel', curdate(), curtime(), now());
SELECT * FROM PEOPLE;
-- CURDATE ,CURTIME & NOW
SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();
SELECT BIRTHDATE FROM PEOPLE; 
SELECT 
    BIRTHDATE, DAYOFWEEK(birthdate)
FROM
    people;
SELECT 
    BIRTHDATE,
    DAY(birthdate),
    DAYOFYEAR(birthdate),
    DAYOFWEEK(birthdate) from people;
SELECT 
    BIRTHDATE,
    DAY(birthdate),
    MONTHNAME(birthdate)
	from people;
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;
SELECT 
    BIRTHTIME, HOUR(BIRTHTIME), MINUTE(BIRTTIME)
FROM
    PEOPLE;

SELECT 
    BIRTHDT,
    MONTH(BIRTHDT),
    DAY(BIRTHDT),
    HOUR(BIRTHDT),
    MINUTE(BIRTHDT)
FROM
    PEOPLE;
SELECT 
    birthdate, DATE_FORMAT(birthdate, '%a %b %D')
FROM
    people;
SELECT 
    birthdt, DATE_FORMAT(birthdt, '%H:%i')
FROM
    people;
SELECT 
    birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r')
FROM
    people;
-- DATE MATH
SELECT 
    BIRTHDATE
FROM
    PEOPLE;
SELECT 
    CURDATE()
FROM
    PEOPLE;
SELECT 
    BIRTHDATE, DATEDIFF(CURDATE(), BIRTHDATE)
FROM
    PEOPLE;
SELECT 
    BIRTHDATE, DATEDIFF(CURDATE(), BIRTHDATE)
FROM
    PEOPLE;
SELECT 
    DATE_ADD(CURDATE(), INTERVAL 1 YEAR)
FROM
    PEOPLE;
SELECT 
    DATE_ADD(CURDATE(), INTERVAL 1 MONTH)
FROM
    PEOPLE;
SELECT 
    BIRTHDATE
FROM
    PEOPLE;
SELECT 
    BIRTHDATE, DATE_ADD(BIRTHDATE, INTERVAL 18 YEAR)
FROM
    PEOPLE;
SELECT CURTIME();
SELECT TIMEDIFF(CURTIME(), '07:00:00');
SELECT NOW() - INTERVAL 230 YEAR;
SELECT NOW() + INTERVAL 23 YEAR;
SELECT 
    NAME, BIRTHDATE, YEAR(BIRTHDATE + INTERVAL 21 YEAR)
FROM
    PEOPLE;
SELECT NOW();
CREATE TABLE CAPTIONS(
TEXT varchar(150),
created_at timestamp default current_timestamp
);
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
insert into captions(text) values('just me and the girtls chilling');
insert into captions(text) values('beautiful sunset');
insert into captions2(text) values(' i love yoy life');
select * from captions;
select * from captions2;
-- Data types exercise
-- 1.Print Out The Current Time?
select curtime();
-- 2.Print Out The Current Date (but not time)
select curdate();
-- 3.Print Out The Current Day Of The Week
select dayofweek(curdate());
-- 4.Print Out The Current Day Of The Week
select dayname(curdate());
select dayname(now());
select BIRTHTIME,dayname(BIRTHTIME) from people;
select date_format(NOW(),'%w');
-- 5.Print out the current day and time using this format: mm/dd/yyyy
select date_format(curdate(),'%m');
select date_format(curdate(),'%d/%m/%Y');
-- 6.Print out the current day and time using this format:January 2nd at 3:15
-- April 1st at 10:18
select curdate();
select now();
select date_format(now(),'%M %D at %k:%i');
-- 7.Create a tweets table that stores:
-- The Tweet content
-- A Username
-- Time it was created
create table tweets(
	content varchar(180),
    username varchar(20),
    created_at timestamp DEFAULT NOW()
    );
    INSERT INTO TWEETS (content, username) values
    ('this is my  first tweet lol','sharma');
    select * from tweets;
-- -- What's a good use case for CHAR?
 
-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, etc.
 
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
-- What's the difference between DATETIME and TIMESTAMP?
 
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.
