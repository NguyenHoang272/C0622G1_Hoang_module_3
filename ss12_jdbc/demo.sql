DROP DATABASE IF EXISTS demo;
create database demo;
use demo;

create table users(
id int not null auto_increment,
`name` varchar(50),
email varchar(50),
country varchar(50),
primary key(id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Hoang','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Vinh','kante@che.uk','Kenia');
insert into users(name, email, country) values('Danh','kante@che.uk','Kenia');