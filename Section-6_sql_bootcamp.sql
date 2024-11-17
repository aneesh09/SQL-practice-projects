create database clothing;
use clothing;
CREATE table shirts(
shirt_id int auto_increment,
primary key(shirt_id),
article  varchar(100),
color VARCHAR(100),
shirt_size VARCHAR(100),
last_worn INT
);
desc shirts;
-- Get All That Data In There
insert into shirts(article,color,shirt_size,last_worn)
values
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
select*from shirts;
-- spring cleaning
-- CRUD
-- Add A New Shirt Purple polo shirt, size M last worn 50 days ago
insert into shirts(article,color,shirt_size,last_worn)
values
('polo shirt', 'purple', 'M', 50);
-- SELECT all shirts But Only Print Out Article and Color
select article,color from shirts;
-- SELECT all medium shirts Print Out Everything But shirt_id
select article,color, shirt_size,last_worn from shirts where shirt_size='M';
update shirts set shirt_size='L' where article ='polo shirt';
select * from shirts where article='polo shirt';
select * from shirts where last_worn=15;
update shirts set last_worn=0 where last_worn =15;
select * from shirts;
select * from shirts where color='white';
update shirts set color='off white'where color='white';
update shirts set shirt_size='XS' where color='off white';
select * from shirts;
-- Delete
select * from shirts where last_worn=200;
Delete from shirts where last_worn=200;
select * from shirts;
Delete from shirts where article='tank top';
delete from shirts;
select * from shirts;
drop table shirts;