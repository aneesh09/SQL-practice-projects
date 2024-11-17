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
-- . COUNT(*) counts the number of rows, so the query to count your animals looks like this:
SELECT 
    COUNT(*)
FROM
    books;
SELECT 
    COUNT(author_lname)
FROM
    books;
-- distinct authors
SELECT 
    COUNT(DISTINCT author_lname) AS total
FROM
    books;
SELECT 
    COUNT(*)
FROM
    books
WHERE
    title LIKE '%the%';
-- group by GROUP BY summarizes or aggregates identical data into single rows
SELECT 
    author_lname, COUNT(*) AS total
FROM
    books
GROUP BY author_lname;
SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;
-- max  & min functions
SELECT 
    MAX(pages)
FROM
    books;
SELECT 
    MIN(pages)
FROM
    books;
SELECT 
    MAX(pages), title
FROM
    books;
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
-- using subquery
SELECT 
    title, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
insert into books (title,pages)values('my life in words', 634);
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
-- SUB QUERY
SELECT 
    *
FROM
    books
WHERE
    pages = (SELECT 
            MIN(pages)
        FROM
            books);
SELECT 
    title, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year = (SELECT 
            MIN(released_year)
        FROM
            books);
-- grouping by for multiple columns
SELECT 
    author_fname, author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
FROM
    books
GROUP BY author;
-- MIN & MAX 
select author_lname,min(released_year) from books group by
author_lname;

select author_lname,Max(released_year),min(released_year)
from books group by author_lname;

SELECT 
    author_lname,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS longest_age_count
FROM
    books
GROUP BY author_lname;

SELECT 
    author_lname,
    author_fname,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release
FROM
    books
GROUP BY author_lname , author_fname;
-- sum
select sum(pages) from books;
SELECT 
    author_lname, SUM(pages)
FROM
    books
GROUP BY author_lname;
-- average
SELECT 
    AVG(released_year) as average
FROM
    books;
SELECT 
    AVG(pages) as average
FROM
    books;
SELECT 
    AVG(stock_quantity) as average
FROM
    books;
SELECT 
    released_year, AVG(stock_quantity), COUNT(*)
FROM
    books
GROUP BY released_year;
-- aggregate functions exercise
-- 1.print the number of books in the database
SELECT 
    COUNT(*)
FROM
    books;
-- 2.Print out how many books were released in each year
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;
-- 3. Print out the total number of books in stock
SELECT 
    SUM(stock_quantity) AS QTY
FROM
    books;
-- 4.Find the average released_year for each author
SELECT 
    author_fname,author_lname, avg(released_year),count(*)
FROM
    books
group by
	author_fname,author_lname;
-- 5.Find the full name of the author who wrote the longest book
-- 1st method
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
-- 2nd method
SELECT 
    concat(author_fname,' ', author_lname) as author, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;
-- last question
SELECT 
    released_year AS Year, COUNT(*) AS total, AVG(pages)
FROM
    books AS avgpages
GROUP BY released_year
ORDER BY released_year;
