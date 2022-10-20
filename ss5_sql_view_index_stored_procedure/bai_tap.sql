DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
use demo;

create table products(
id int primary key auto_increment,
product_code varchar(45),
product_name varchar(45),
product_price float,
product_amount int,
product_description varchar(45),
product_status bit
);

insert into products
values(1,'P001','Ô mô', 35000, 50, 'Sạch những vết bẩn cứng đầu',0),
(2,'P002','Aba', 35000, 50, 'Sạch những vết bẩn cứng đầu',0),
(3,'P003','Compho', 35000, 50, 'Sạch những vết bẩn cứng đầu và thơm lâu',1),
(4,'P004','Chou Chou', 35000, 50, 'Sạch những vết bẩn cứng đầu và lưu hương lâu',0);

create unique index i_index on products(product_code);
drop index i_index on products;
create index i_index1 on products(product_name,product_price);
drop index i_index1 on products;
explain select * from products;

-- VIEW
create view products_view
as
select product_code,product_name,product_status
from products;
select * from products_view;


-- cập nhật view
create or replace view products_view
as
select product_code,product_name,product_status, product_amount
from products;
select * from products_view;

-- xóa view
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure select_all_products()
begin
		select *
		from products;	
end;
// delimiter ;
-- xóa store procedure
drop procedure select_all_products;
-- gọi store procedure
call select_all_products();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_one_products(p_code varchar(10),p_name varchar(50),p_price double,p_amount int,p_description text,p_status bit)
begin
		insert into products (product_code,product_name ,product_price ,product_amount ,product_description ,product_status) values
		(p_code,p_name ,p_price ,p_amount ,p_description ,p_status);
end;
// delimiter ;
-- xóa store procedure
drop procedure add_one_products;
-- gọi store procedure
call add_one_products('P001','Ô mô', 35000, 50, 'Sạch những vết bẩn cứng đầu',0);

-- sửa thông tin
delimiter //
create procedure update_products_by_id(p_id int,p_code varchar(10),p_name varchar(50),p_price double,p_amount int,p_description text,p_status bit)
begin
		update products set product_code=p_code, product_name = p_name,product_price = p_price,product_amount= p_amount,product_description= p_description,product_status= p_status
        where id=p_id;
        
end;
// delimiter ;
drop procedure update_products_by_id;
call update_products_by_id(1,'P001','aba', 35000, 50, 'Sạch những vết bẩn cứng đầu',0);

-- Xóa theo id
delimiter //
create procedure delete_products_by_id(p_id int)
begin
		delete from products
        where id=p_id;
        
end;
// delimiter ;
drop procedure delete_products_by_id;
call delete_products_by_id(2);



