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

-- Hi???n th??? c??c th??ng tin  g???m oID, oDate, oPrice c???a t???t c??? c??c h??a ????n trong b???ng Order
select o_id, o_date, o_total_price from `order`;

-- Hi???n th??? danh s??ch c??c kh??ch h??ng ???? mua h??ng, v?? danh s??ch s???n ph???m ???????c mua b???i c??c kh??ch
select customer.c_name, product.p_name
from customer
inner join `order` on customer.c_id = `order`.c_id
inner join order_detail on `order`.o_id= order_detail.o_id
inner join product on order_detail.p_id = product.p_id;

-- Hi???n th??? t??n nh???ng kh??ch h??ng kh??ng mua b???t k??? m???t s???n ph???m n??o
select * from customer where customer.c_id not in (select c_id from `order`);

-- Hi???n th??? m?? h??a ????n, ng??y b??n v?? gi?? ti???n c???a t???ng h??a ????n (gi?? m???t h??a ????n ???????c t??nh b???ng t???ng gi??
--  b??n c???a t???ng lo???i m???t h??ng xu???t hi???n trong h??a ????n.
--  Gi?? b??n c???a t???ng lo???i ???????c t??nh = odQTY*pPrice)
select `order`.o_id,`order`.o_date,sum(order_detail.od_qty*product.p_price) as total_order_price
from `order`
inner join order_detail on `order`.o_id = order_detail.o_id
inner join product on order_detail.p_id = product.p_id
group by `order`.o_id;




