DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE student (
    `id` INT PRIMARY KEY,
    `name` VARCHAR(45),
    `age` INT,
    `country` VARCHAR(45)
);
CREATE TABLE class(
`id` INT PRIMARY KEY,
`name` VARCHAR(45)NULL
);
CREATE TABLE teacher(
`id` INT PRIMARY KEY,
`name` VARCHAR(45)NULL,
`age` INT,
`country` VARCHAR(45)NULL
);
INSERT INTO student(id, name, age, country)
VALUES(001,"Nguyễn Mậu Hoàng",22,"Việt Nam");