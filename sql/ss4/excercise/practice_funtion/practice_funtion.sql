drop database if exists practice_funtion;
create database practice_funtion;
use practice_funtion;
create table class (
    class_id int not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date datetime not null,
    `status` bit
);
create table student (
    student_id int not null auto_increment primary key,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    `status` bit,
    class_id int not null,
    foreign key (class_id)
        references class (class_id)
);
create table `subject` (
    sub_id int not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit tinyint not null default 1 check (Credit >= 1),
    `status` bit default 1
);

create table mark (
    mark_id int not null auto_increment primary key,
    sub_id int not null,
    student_id int not null,
    mark float default 0 check (mark between 0 and 100),
    exam_times tinyint default 1,
    unique (sub_id , student_id),
    foreign key (sub_id)
        references subject (sub_id),
    foreign key (student_id)
        references student (student_id)
);
insert into class
values (1, 'A1', '2008-12-20', 1);
insert into class
values (2, 'A2', '2008-12-22', 1);
insert into class
values (3, 'B3', current_date, 0);
insert into student (student_name, address, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, `status`, class_id)
values ('Hoa', 'Hai phong', 1, 3);
insert into student (student_name, address, phone, `status`, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into subject
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into mark (sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
 -- câu 1      
select 
    sub.sub_id, sub.sub_name, max(credit)
from
    `subject` sub
group by sub.sub_id , sub.sub_name
having max(credit) >= all (select 
        max(credit)
    from
        `subject` sub
    group by sub.sub_id , sub.sub_name);
    
   -- câu 2 
select 
    sub.sub_name, sub.sub_id, max(mark)
from
    mark m
        join
    `subject` sub on m.sub_id = sub.sub_id
group by sub.sub_name , sub.sub_id
having max(mark) >= all (select max(mark)
    from
        mark
    group by sub.sub_name , sub.sub_id);select 
    sub.sub_name, sub.sub_id, max(mark)
from
    mark m
        join
    `subject` sub on m.sub_id = sub.sub_id
group by sub.sub_name , sub.sub_id
having max(mark) >= all (select 
        max(mark)
    from
        mark
    group by sub.sub_name , sub.sub_id);
    
    
-- câu 3    
select 
    s.student_id, s.student_name, avg(mark)
from
    student s
        join
    mark m on s.student_id = m.student_id
group by s.student_id , s.student_name
order by (avg(mark)) desc;