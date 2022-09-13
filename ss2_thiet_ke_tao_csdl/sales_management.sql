DROP DATABASE IF EXISTS sales_management;
CREATE DATABASE sales_management;
use sales_management;

create table customer(
customer_id int primary key,
customer_name varchar(45),
customer_age int
); 

create table `order`(
order_id int primary key,
customer_id int,
order_day date,
order_total_price double
);

create table product(
product_id int primary key,
product_name varchar(45),
product_age int
); 

create table order_detail(
primary key (order_id, product_id),
od_qty varchar(45),
order_id int,
product_id int,
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);

