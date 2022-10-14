drop DATABASE IF EXISTS student_management ;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE `student_management`.`class` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) 

   );
   CREATE TABLE `student_management`.`teacher` (
  `id` int auto_increment  PRIMARY KEY,
  `name` VARCHAR(45) ,
  `age` int,
  `country` varchar(255) 
  );
  INSERT INTO `student_management`.`class` ( `name`) VALUES ('vinh');
  INSERT INTO `student_management`.`class` ( `name`) VALUES ('vinh1');
  INSERT INTO `student_management`.`class` ( `name`) VALUES ('vinh2');
  INSERT INTO `student_management`.`class` ( `name`) VALUES ('vinh3');
