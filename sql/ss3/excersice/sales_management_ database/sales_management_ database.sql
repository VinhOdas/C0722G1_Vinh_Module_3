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
create table order_detail (
o_id int,
p_id int,
odQTY int,
foreign key (o_id) references orders(o_id),
foreign key (p_id) references product(p_id)
);
insert into customer(c_name,c_age) value
( 'Minh Quan',  10),
( 'Ngoc Oanh', 20),
( 'Hong Ha',  50);
insert into orders(c_id,o_date,o_total_price) value
(1, '2006-03-12',  null),
(2, '2006-03-23', null),
(1, '2006-03-03',  null);
insert into product(p_name,p_price) value
( 'May Giat',  3),
( 'Tu Lanh', 5),
( 'Dieu Hoa', 7),
( 'Quat', 1),
( 'Bep Dien',  2);
insert into order_detail(o_id,p_id,odQTY) value
( 1,1, 3),
( 1,3, 7),
(1, 4, 2),
(2, 1, 1),
(3,1, 8),
( 2,5, 4),
( 2,3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date,o_total_price 
from orders;


-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select  customer.c_name, product.p_name
from customer
 join orders
on customer.c_id = orders.c_id
join order_deitail
on order_deitail.o_id = orders.o_id
join product
on order_deitail.p_id = product.p_id;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select  customer.c_name, product.p_name
from customer
left join orders on customer.c_id = orders.c_id
left join order_deitail on order_deitail.o_id = orders.o_id
left join product on order_deitail.p_id = product.p_id
where product.p_name is null;


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất
-- hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id,o.o_date,sum(od.odQTY * p.p_price) as tong
from orders o  
inner join order_detail od on o.o_id = od.o_id
inner join product p on od.p_id = p.p_id
-- inner join customer c on c.c_id = o.c_id
group by o.o_id;