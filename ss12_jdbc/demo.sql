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


select *from users order by name ;
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users	
    where users.id = user_id
    END
// DELIMITER ;
DELIMITER //
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END
// DELIMITER ;
-- hiện thị tất cả danh sách
delimiter //
create procedure select_all_users ()
begin
	select *
    from users;
end;
// delimiter ;
-- Xóa procedure
drop procedure select_all_users;
-- Gọi procedure
call select_all_users ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_user_by_id(p_id int,p_name varchar(50),p_email varchar(50),p_country varchar(50))
begin
UPDATE users
SET
    `name` = p_name,
    email = p_email,
    country = p_country
WHERE
    id = p_id;
end;
// delimiter ;
-- xóa store procedure
drop procedure edit_user_by_id;
-- gọi store procedure
call edit_user_by_id(6,"Vinh","gamquangvinh@gmail.com","Việt Nam");
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_user_by_id(p_id int)
begin
		delete
        from users
		where id = p_id;
end;
// delimiter ;
-- xóa store procedure
drop procedure delete_user_by_id;
-- gọi store procedure
call delete_user_by_id(5);