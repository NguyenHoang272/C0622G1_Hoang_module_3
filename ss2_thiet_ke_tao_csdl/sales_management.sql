DROP DATABASE IF EXISTS sales_management;
CREATE DATABASE sales_management;
use sales_management;
CREATE TABLE customer(
c_id INT PRIMARY KEY AUTO_INCREMENT,
c_name VARCHAR(45),
c_age INT
);
CREATE TABLE `order`(
o_id INT PRIMARY KEY AUTO_INCREMENT,
c_id INT,
o_date DATE,
o_total_price DOUBLE,
FOREIGN KEY (c_id) REFERENCES customer(c_id)
);
CREATE TABLE product(
p_id INT PRIMARY KEY AUTO_INCREMENT,
p_name VARCHAR(45),
p_price DOUBLE
);
CREATE TABLE order_detail(
o_id INT,
p_id INT,
od_qty INT,
PRIMARY KEY (o_id,p_id),
FOREIGN KEY (o_id) REFERENCES `order`(o_id),
FOREIGN KEY (p_id) REFERENCES product(p_id)
);

INSERT INTO `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) VALUES (1, 'Minh Quan', 10);
INSERT INTO `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) VALUES (2, 'Ngoc Oanh', 20);
INSERT INTO `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) VALUES (3, 'Hong Ha', 50);
INSERT INTO `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) VALUES (1, 1, '2006-03-21', Null);
INSERT INTO `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) VALUES (2, 2, '2006-03-23', Null);
INSERT INTO `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) VALUES (3, 1, '2006-03-16', Null);
INSERT INTO `sales_management`.`product` (`p_id`, `p_name`, `p_price`) VALUES (1, 'May Giat', 3);
INSERT INTO `sales_management`.`product` (`p_id`, `p_name`, `p_price`) VALUES (2, 'Tu Lanh', 5);
INSERT INTO `sales_management`.`product` (`p_id`, `p_name`, `p_price`) VALUES (3, 'Dieu Hoa', 7);
INSERT INTO `sales_management`.`product` (`p_id`, `p_name`, `p_price`) VALUES (4, 'Quat', 1);
INSERT INTO `sales_management`.`product` (`p_id`, `p_name`, `p_price`) VALUES (5, 'Bep Dien', 2);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (1, 1, 3);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (1, 3, 7);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (1, 4, 2);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (2, 1, 1);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (3, 1, 8);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (2, 5, 4);
INSERT INTO `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) VALUES (2, 3, 3);

select o_id, o_date, o_total_price from `order`;
SELECT customer.c_name, product.p_name
FROM customer
INNER JOIN `order` ON customer.c_id = `order`.c_id
INNER JOIN order_detail ON `order`.o_id= order_detail.o_id
INNER JOIN product ON order_detail.p_id = product.p_id;
SELECT * FROM customer WHERE customer.c_id not in (SELECT c_id FROM `order`);
SELECT `order`.o_id,`order`.o_date,SUM(order_detail.od_qty*product.p_price) as total_order_price
FROM `order`
INNER JOIN order_detail ON `order`.o_id = order_detail.o_id
INNER JOIN product ON order_detail.p_id = product.p_id
GROUP BY `order`.o_id;




