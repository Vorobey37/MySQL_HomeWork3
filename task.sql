use home_work_3;

/*Таблица staff для заданий*/
create table staff (
id int primary key auto_increment,
firstname varchar(30),
lastname varchar(30),
post varchar(30),
seniority int,
salary int,
age int
);

insert into staff (firstname, lastname, post, seniority, salary, age)
values ("Вася", "Петров", "Начальник", 40, 100000, 60),
("Петр", "Власов", "Начальник", 8, 70000, 30),
("Катя", "Катина", "Инженер", 2, 70000, 25),
("Саша", "Сасин", "Инженер", 12, 50000, 35),
("Иван", "Иванов", "Рабочий", 40, 30000, 59),
("Петр", "Петров", "Рабочий", 20, 25000, 40),
("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
("Антон", "Антонов", "Рабочий", 8, 19000, 28),
("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
("Максим", "Максимов", "Рабочий", 2, 11000, 22),
("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
("Людмила", "Маркина", "Уборщик", 10, 10000, 49);

select * from staff;

/*1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания*/
select salary as "з/п по возрастанию"
from staff
order by salary;

select salary as "з/п по убыванию"
from staff
order by salary desc;

/*2. Выведите 5 максимальных заработных плат*/
select firstname, lastname, salary as "ТОП 5 з/п"
from staff
order by salary desc
limit 5;

/*3. Посчитайте суммарную зарплату (salary) по каждой специальности (post)*/
select sum(salary), post
from staff
group by post;

/*4. Найдите количество сотрудников с специальностью (post) "Рабочий" в возрасте от 24 до 49 лет включительно*/
select count(id) as "Количество сотрудников", post
from staff
where age >= 24 and age <= 49 and post = "Рабочий"
group by post;

/*5. Найдите количество специальностей*/
select count(distinct post) as "Количество специальностей"
from staff;

/*6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет*/
/*Таких средних возрастов нет, поэтому сделал меньше 40 лет хотя бы для наглядности*/
select post as "Специальность", avg(age) as "Средний возраст"
from staff
group by post
having avg(age) < 40;

