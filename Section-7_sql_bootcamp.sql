CREATE database Book_shop;
use Book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
select * from books;
DESC books;
-- CONCAT (Combine Data for Cleaner Output)
-- CONCAT(str1,str2,...)
-- 
select 1+56;
select CONCAT('h','e','l','l','o');
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS Author_name
FROM
    books;
-- CONCAT WS(seperated by delimiter)
-- CONCAT_WS(separator,str1,str2,...)
SELECT CONCAT_WS('!', 'hi', 'bye', 'lol');
SELECT 
    CONCAT_WS('-', title, author_fname, author_lname)
FROM
    books;
-- substring
SELECT SUBSTRING('hello world', 1, 11);
-- only shows 11th character
SELECT SUBSTRING('hello world', 11);
-- last 3 charater
SELECT SUBSTRING('hello world', - 3);
-- first 2 charater
SELECT SUBSTRING('hello world', 2);
SELECT 
    SUBSTRING(title, 1, 10) AS 'short title'
FROM
    books;
SELECT 
    SUBSTR(title, 1, 10) AS 'short title'
FROM
    books;
-- combinng string
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS Short_title
FROM
    books;
SELECT 
    CONCAT(SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS Author_initials
FROM
    books;
    -- Replace:-Replace occurrences of a specified string
    -- REPLACE(str,from_str,to_str)
SELECT 
    REPLACE('HELLO WORLD',
        'HELLO',
        'NAMASTE');
SELECT 
    REPLACE('cheese bread coffee milk',
        ' ',
        ' and ');
SELECT 
    REPLACE(title, ' ', '-')
FROM
    books;
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('Hello World', 'o', '0');
SELECT REPLACE('HellO World', 'o', '*');
SELECT 
    REPLACE('cheese bread coffee milk',
        ' ',
        ' and ');
SELECT 
    REPLACE(title, 'e ', '3')
FROM
    books;
SELECT 
    REPLACE(title, ' ', '-')
FROM
    books;
-- REVERSE:-Returns the string str with the order of the characters reversed, or NULL if str is NULL.
SELECT REVERSE('Hello World');
SELECT REVERSE('Paneer Butter Masala');
SELECT 
    REVERSE(author_fname)
FROM
    books;
SELECT REVERSE('colttloc');
SELECT 
    CONCAT(author_fname, REVERSE(author_fname))
FROM
    books;
SELECT REVERSE('meow meow');
-- char length:-Returns the length of the string str, measured in code points.
SELECT CHAR_LENGTH('hello world');
SELECT 
    CHAR_LENGTH(Title) AS len, title
FROM
    books;
SELECT 
    author_lname, CHAR_LENGTH(author_lname) AS 'length'
FROM
    books;
SELECT 
    CONCAT(author_lname,
            'is',
            CHAR_LENGTH(author_lname),
            'characters long')
FROM
    books;
    -- upper():-Returns the string str with all characters changed to uppercase according to the current character set mapping, or NULL if str is NULL.
SELECT UPPER('Hello world');
SELECT LOWER('Hello world');
SELECT 
    UPPER(title) AS UPPER
FROM
    books;
SELECT 
    LOWER(title) AS UPPER
FROM
    books;
SELECT UPPER('Hello world');
SELECT 
    CONCAT('I LOVE', ' ', UPPER(title), '!!!!!!')
FROM
    books;
SELECT 
    CONCAT('MY FAVORITE BOOK IS ', UPPER(title))
FROM
    books;
 
SELECT 
    CONCAT('MY FAVORITE BOOK IS ', LOWER(title))
FROM
    books;   
 -- insert
 SELECT INSERT('HELLO ANEESH',6,0,'THERE');
 SELECT INSERT('HELLO ANEESH',6,7,' THERE');
 -- LEFT 
 SELECT LEFT('HELLO ANEESH',3);
 -- RIGHT
  SELECT RIGHT('HELLO ANEESH',3);
  SELECT RIGHT('omghahalol!', 4);
  SELECT LEFT (author_fname,1)from books;
  SELECT LEFT('omghahalol!', 3);
  SELECT right (author_lname,1)from books;
  -- TRIM:-Returns the string str with all remstr 
  -- prefixes or suffixes removed.
  SELECT TRIM('   BOSTON  ');
  SELECT TRIM(LEADING '.' FROM '......san antonio,,');
  SELECT TRIM('  pickle  ');
  -- string function exercise
  DESC books;
  -- EX-1 why does my cat look at me with such hatred? Convert to upper case
  select REVERSE(UPPER('why does my cat look at me with such hatred?'));
  -- EX2 what does this print out?
  SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  select replace(title,' ','->') as title from books;
  select author_lname as forwards,reverse(author_lname)as backwards from books;
  select upper(concat(author_fname,' ',author_lname))as Full_name from books;
SELECT CONCAT(title,' was released in',released_year)as blurb from books;
SELECT title,char_length(title)as charater_count from books;
select  concat(substring(title,1,10),'...')as short_title, 
        concat(author_lname,',',author_fname) as Author,
        concat(stock_quantity,'in stock') as quantity
from books;