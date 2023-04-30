drop table public.employee;

create table public.employee (
id bigserial not null primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(6) not null,
age int not null
);

ALTER TABLE employee  
ALTER COLUMN gender set default ('m');


insert into employee (first_name, last_name, gender,age) values('Степан', 'Степанович','m',30 );
insert into employee (first_name, last_name, gender,age) values('John', 'White','m',24 );
insert into employee (first_name, last_name, age) values('Mark', 'Hunter',45 );

select * 
from employee;

update employee 
set (first_name, last_name, age) = ('Стивен','Бушеми',34)
where id = 2;

delete 
from employee
where id = 1;

select * 
from employee
order by  id;

truncate table employee;