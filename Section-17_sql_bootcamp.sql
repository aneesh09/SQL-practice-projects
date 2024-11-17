create database ig_clone;
use ig_clone;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photos(
id integer auto_increment primary key,
image_url VARCHAR(255) NOT NULL,
user_id integer not null,
created_at timestamp default now(),
foreign key(user_id) references users(id)
);
show tables;
select * from photos;
create table comments(
   id INTEGER auto_increment primary key,
   comment_text varchar(255) not null,
   user_id integer not null,
   photo_id integer not null,
   created_at  timestamp DEFAULT NOW(),
   foreign key(user_id) references users(id),
   foreign key(photo_id) references photos(id));
   

show tables;

create table likes(
primary key (user_id,photo_id),
user_id integer not null,
photo_id integer not null,
created_at  timestamp DEFAULT NOW(),
foreign key(user_id) references users(id),
foreign key(photo_id) references photos(id));



create table follows (
follower_id integer not null,
followee_id integer not null,
created_at  timestamp DEFAULT NOW(),
foreign key(follower_id) references users(id),
foreign key(followee_id) references users(id),
primary key(follower_id,followee_id)
);

describe follows;

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
insert into likes(user_id,photo_id)values
(1,1),
(2,1),
(1,2),
(1,3),
(3,2);
-- won`t work because of primary key
insert into follows(follower_id,followee_id)values
(1,2),
(2,1),
(3,1),
(1,3);
select * from follows;
insert into comments(comment_text,user_id,photo_id)values
('Meow',1,2),
('Amazing shot!',3,2),
('I<3 this',2,1);

insert  into photos(image_url,user_id)values
('/dafafewvw3424',1),
('/dafawefeww3424',2),
('/dafawefefrw3424',3);

insert into users(username)values
('Bluechats'),
('charliebrown'),
('Aneesh07');

insert into tags(tag_name) values
('adorable'),
('cute'),
('sunrise');

insert into photo_tags(photo_id,tag_id) values
(1,1),
(1,2),
(2,3),
(3,2);
select * from tags;
select * from photo_tags;