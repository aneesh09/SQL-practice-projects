use book_shop;
DESC books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
    select * from books;       
-- DISTINCT :-DISTINCT combined with ORDER BY needs a temporary table in many cases.
SELECT 
    author_lname
FROM
    books;
SELECT DISTINCT
    author_lname
FROM
    books;
SELECT 
    released_year
FROM
    books;
SELECT DISTINCT
    released_year
FROM
    books;
-- 1st method for distinct
SELECT DISTINCT
    CONCAT(author_fname, ' ', author_lname)
FROM
    books;
-- 2nd method
SELECT DISTINCT
    author_fname, author_lname, released_year
FROM
    books;
-- order by:-An ORDER BY with and without LIMIT may return rows in different orders
insert into books(title,author_lname) values('MY LIFE','Sharma');
SELECT 
    book_id, title, author_lname
FROM
    books;
SELECT 
    author_fname, author_lname
FROM
    books
ORDER BY author_lname;
-- ascending order
SELECT 
    book_id, author_fname, author_lname
FROM
    books
ORDER BY author_lname ASC;

SELECT 
    book_id, title, author_lname
FROM
    books;
SELECT 
    book_id,author_fname, author_lname
FROM
    books
ORDER BY author_lname DESC;
select
	title,pages 
from
	books
order by
	pages;
select 
	title,pages,released_year
from
	books
order by
	released_year;
-- order by
select	
	title,author_fname,author_lname
from
	books
order by
	2;
select 
	author_lname,released_year,title
from 
	books
order by
	author_lname;
select
	author_lname,released_year,title 
from 
	books
order by
	author_lname,released_year
desc;
select concat(author_fname,' ',author_lname)
as author from books;
-- Limit
SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year
LIMIT 6;
SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year desc
LIMIT 0,5;
SELECT 
    title, released_year
FROM
    books
ORDER BY released_year 
LIMIT 0,2;
SELECT 
    book_id, title, released_year
FROM
    books
ORDER BY released_year
LIMIT 5,7;
select 
	title
from 
	books
order by
	title
limit 18,28937182;
select title,author_fname,author_lname,pages
from books
where author_fname like '%da';
select title,author_fname,author_lname,pages
from books
where title LIKE'%:%';
Select * from books
where author_fname like '______';
-- 'a' inbetween
select * from books
where author_fname like '_a_';
-- /somewhere within the string
select * from books
where  title like'%\%%';
select * from books
where  title like'%\_%';
-- final exercise
-- 1.select all story collections, that contain story
SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';
-- 2.find the longest book print out the title and page count
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
-- 3 Print a summary containing the title and year, for the 3 most recent books
SELECT 
    CONCAT(title, '-', released_year) AS Summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;
-- 4 find all books with an author _lname that contains a space(" ")
-- to get space use % %
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';
-- 5 find the 3 books with lowest stock,select title,year and stock
DELETE FROM books 
WHERE
    title = 'MY LIFE';
SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity ASC
LIMIT 3;
-- 6 Print title and author_lname,sorted first by author_lname and then by title
SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;
-- 7 Print 'my favourite author is author_fname & author_lname
SELECT 
    CONCAT('MY FAVOURITE AUTHOR IS ',
            UPPER(author_fname),
            ' ',
            UPPER(author_lname)) AS yell
FROM
    books
ORDER BY author_fname DESC;

