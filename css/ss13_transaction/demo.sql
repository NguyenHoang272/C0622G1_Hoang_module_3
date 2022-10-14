DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    country VARCHAR(50)
);
insert into users(name, email, country) values('Thúi Mát','thui@codegym.vn','Lao');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
insert into users(name, email, country) values('Hoang','kante@che.uk','Kenia');
insert into users(name, email, country) values('Thúi Mát','kante@che.uk','Kenia');


DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;

delimiter //
CREATE PROCEDURE get_all_user()
BEGIN
SELECT*
FROM users;
END //
delimiter ;
-- call get_all_user();
delimiter //
CREATE PROCEDURE get_update_user(IN user_id INT,
								IN user_name varchar(50),
								IN user_email varchar(50),
								IN user_country varchar(50))
BEGIN
UPDATE users
SET NAME=user_name, email=user_email, country=user_country
WHERE id=user_id;
END //
delimiter ;

DELIMITER //
CREATE PROCEDURE delete_user(in user_id int)
BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM users
WHERE users.id = user_id ;
END //
DELIMITER ;