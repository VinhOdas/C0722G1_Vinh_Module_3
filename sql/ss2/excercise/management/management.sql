drop database if exists management_database;
create database management_database;
use management_database;
create table customer(
c_id int primary key auto_increment,
c_name varchar(45),
c_age int
);
create table orders (
o_id int primary key auto_increment,
c_id int ,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int
);
create table product(
p_id int primary key auto_increment,
p_name varchar(45),
p_price int
);
create table Order_deitail (
o_id int,
p_id int,
foreign key (o_id) references orders(o_id),
foreign key (p_id) references product(p_id),
order_deitail varchar(45)
);
