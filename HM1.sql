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

--## 1 Задание
insert into employee (first_name, last_name, gender, age) values('Мария', 'Долматова','w',45 );
insert into employee (first_name, last_name, age) values('Antony', 'Smith',45 );

select first_name as имя, last_name as фамилия
from employee

select first_name as имя, last_name as фамилия
from employee
where age < 30 or age > 50;

select first_name as имя, last_name as фамилия
from employee
where age >= 30 and age <= 50;

select first_name as имя, last_name as фамилия
from employee
order by  фамилия desc;

SELECT *
FROM employee
where LENGTH(first_name) > 4;

--## 2 Задание

update employee
set first_name = 'Mark'
where id = 14;
update employee

select first_name as имя, sum(age) as суммарный_возраст
from employee
group by first_name

select first_name as имя, age as возраст
from employee
where age = (
    select min(age) as минимальный_возраст
    from employee);

select first_name as имя, age as возраст
from employee
where  first_name = (select distinct first_name from employee )

update employee
set age= 55
where id = 14;

select first_name as имя, max(age) as возраст
from employee e
group by first_name
having count(first_name) > 1
order by возраст


--Работа с несколькими таблицами
create table city(
                     city_id bigserial not null primary key,
                     city_name varchar(50) not null);


ALTER TABLE employee
    ADD city_id int null

insert into city (city_name) values('London' );

SELECT *
FROM employee

update  employee
set city_id = 2
where id = 17;

ALTER TABLE employee
    ADD CONSTRAINT employee FOREIGN KEY (city_id)
        REFERENCES city (city_id)

select *
from employee
         inner join city on city.city_id = employee.city_id;

select *
from city
         left join employee on city.city_id = employee.city_id;

select *
from city
         full join employee on city.city_id = employee.city_id;

select *
from city
         cross join employee;