drop database if exists sales_management;
create database sales_management;
use sales_management;
create table customer(
c_id int primary key auto_increment,
c_name varchar(45),
c_age int
);
create table `order`(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price double,
foreign key (c_id) references customer(c_id)
);
create table product(
p_id int primary key auto_increment,
p_name varchar(45),
p_price double
);
create table order_detail(
o_id int,
p_id int,
od_qty int,
primary key (o_id,p_id),
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);

insert into `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) values (1, 'Minh Quan', 10);
insert into `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) values (2, 'Ngoc Oanh', 20);
insert into `sales_management`.`customer` (`c_id`, `c_name`, `c_age`) values (3, 'Hong Ha', 50);
insert into `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) values (1, 1, '2006-03-21', null);
insert into `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) values (2, 2, '2006-03-23', null);
insert into `sales_management`.`order` (`o_id`, `c_id`, `o_date`, `o_total_price`) values (3, 1, '2006-03-16', null);
insert into `sales_management`.`product` (`p_id`, `p_name`, `p_price`) values (1, 'May Giat', 3);
insert into `sales_management`.`product` (`p_id`, `p_name`, `p_price`) values (2, 'Tu Lanh', 5);
insert into `sales_management`.`product` (`p_id`, `p_name`, `p_price`) values (3, 'Dieu Hoa', 7);
insert into `sales_management`.`product` (`p_id`, `p_name`, `p_price`) values (4, 'Quat', 1);
insert into `sales_management`.`product` (`p_id`, `p_name`, `p_price`) values (5, 'Bep Dien', 2);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (1, 1, 3);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (1, 3, 7);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (1, 4, 2);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (2, 1, 1);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (3, 1, 8);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (2, 5, 4);
insert into `sales_management`.`order_detail` (`o_id`, `p_id`, `od_qty`) values (2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date, o_total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.c_name, product.p_name
from customer
inner join `order` on customer.c_id = `order`.c_id
inner join order_detail on `order`.o_id= order_detail.o_id
inner join product on order_detail.p_id = product.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer where customer.c_id not in (select c_id from `order`);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá
--  bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id,`order`.o_date,sum(order_detail.od_qty*product.p_price) as total_order_price
from `order`
inner join order_detail on `order`.o_id = order_detail.o_id
inner join product on order_detail.p_id = product.p_id
group by `order`.o_id;




