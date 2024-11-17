create database many_to_many;
use many_to_many;
create table reviewers(
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
released_year YEAR,
genre VARCHAR(100)
);

CREATE TABLE reviews(
id INT PRIMARY KEY AUTO_INCREMENT,
rating decimal(2,1),
series_id INT,
reviewer_id INT,
foreign key(series_id) references series(id),
foreign key(reviewer_id) references reviewers(id)
);
show tables;
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
    
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
select * from series;
select * from reviews;
select * from reviewers;
-- TV Series challenge#1
SELECT 
    title, rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id;
-- TV Series challenge#2
SELECT 
    title, AVG(rating) AS avg_rating
FROM
    series
        JOIN
    REVIEWS ON series.id = reviews.series_id
GROUP BY title
order by avg_rating;
-- TV Series challenge#3
SELECT 
    first_name,last_name,rating
FROM
    reviewers
        JOIN
    reviews ON reviews.reviewer_id=reviewer_id;
-- TV Series challenge#4
select title as unreviewed_series
from series
left join
reviews on series.id=reviews.series_id
where 
rating is null;

select title as unreviewed_series
from series
right join
reviews on series.id=reviews.series_id
where 
rating is null;
-- TV Series challenge#5
SELECT 
    genre, round(AVG(rating),2) as Avg_rating
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_iD
    group by genre;
-- TV Series challenge#6
-- 1st method
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS Average,
    CASE
        WHEN COUNT(rating) > 0 THEN 'Active'
        ELSE 'Inactive'
    END as Status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;

-- 2nd method
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS Average,
    if (COUNT(rating) > 0,'ACTIVE','INACTIVE')as Status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;

-- TV Series challenge#7
SELECT 
    TITLE, RATING, CONCAT(FIRST_NAME,' ', LAST_NAME) AS REVIEWER
FROM
    SERIES
        JOIN
    SERIES ON REVIEWS.SERIES_ID = SERIES.ID
        JOIN
    REVIEWERS ON REVIEWS.REVIEWER_ID = REVIEWERS.ID;
-- 2ND METHOD
SELECT 
    TITLE, RATING, CONCAT(FIRST_NAME,' ', LAST_NAME) AS REVIEWER
FROM
    REVIEWERS
        JOIN
    REVIEWS ON REVIEWS.REVIEWER_ID = REVIEWERS.ID
        JOIN
    SERIES ON REVIEWS.SERIES_ID = SERIES.ID;
     -- SECTION 15
  SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
       
       -- we can create a view:
CREATE VIEW full_reviews AS
    SELECT 
        title, released_year, genre, rating, first_name, last_name
    FROM
        reviews
            JOIN
        series ON series.id = reviews.series_id
            JOIN
        reviewers ON reviewers.id = reviews.reviewer_id;
  -- updatable view
CREATE VIEW order_series AS
    SELECT 
        *
    FROM
        series
    ORDER BY released_year;
SELECT 
    *
FROM
    order_series;
  insert into order_series (title, released_year,genre)
  values('the great','2024','comedy');
  
  CREATE OR REPLACE VIEW order_series AS
    SELECT 
        *
    FROM
        series
    ORDER BY released_year DESC;
  
  ALTER VIEW order_series as 
  select * from series order by released_year;
  
  drop view order_series;
-- having	
SELECT 
    title, AVG(rating), COUNT(rating) AS review_count
FROM
    full_reviews
GROUP BY title
HAVING COUNT(rating) < 2;
-- WITH ROLLUP
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;
 
 SELECT 
    first_name, released_year, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;
-- SQL MODES
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- to set the modes
SET GLOBAL sql_mode='modes';
SET SESSION sql_mode='modes';

SET SESSION sql_mode='ONLY_FULL_GROUP_BY';
SELECT title,AVG(rating) from series 
join reviews on reviews.series_id=series.id
group by title;
-- USE GROUP BY WITH AGG FUNCTIONS
SET SESSION sql_mode=' ';
-- TO DISABLE SESSION USE THIS COMMAND
SELECT title,rating from series 
join reviews on reviews.series_id=series.id
group by title;
SET SESSION sql_mode='ONLY_FULL_GROUP_BY';

SELECT @@GLOBAL.sql_mode;
select date('2010-01-00');
SET @@session.sql_mode='NO_ZERO_IN_DATE';
select date('2010-01-00');
SHOW WARNINGS;
CREATE TABLE dates(d DATE);
INSERT INTO dates(d) values ('2023-11-00');
show warnings;
select * from dates;
SET @@session.sql_mode=' ';
SET session sql_mode='NO_ZERO_IN_DATE,STRICT_TRANS_TABLE';
INSERT INTO dates(d) values ('2023-11-00');
SELECT @@SESSION.sql_mode;
SET @@session.sql_mode=' ';
