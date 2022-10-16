drop database if exists  student_management ;
create database student_management;
USE student_management;
create table `student_management`.`class` (
  `id` int primary key auto_increment,
  `name` varchar(255) 

   );
   create table `student_management`.`teacher` (
  `id` int auto_increment  PRIMARY KEY,
  `name` varchar(45) ,
  `age` int,
  `country` varchar(255) 
  );
  insert into `student_management`.`class` ( `name`) values ('vinh');
  insert into `student_management`.`class` ( `name`) values ('vinh1');
  insert into `student_management`.`class` ( `name`) values ('vinh2');
  insert into `student_management`.`class` ( `name`) values ('vinh3');
