--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.employees_name, salary.monthly_salary from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employees.employees_name, salary.monthly_salary from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select roles.role_name , salary.monthly_salary  from roles_salary_2
join roles on roles_salary_2.id_role = roles.id 
join salary on roles_salary_2.id_salary = salary.id;

--4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select roles.role_name , salary.monthly_salary  from roles_salary_2
join roles on roles_salary_2.id_role = roles.id 
join salary on roles_salary_2.id_salary = salary.id
where monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.

select employees.employees_name  
from employee_salary
right outer join employees
on employee_salary.employee_id = employees.id 
where employee_id is null;

--6. Вывести всех работников с названиями их должности.

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
left join roles
on roles_employee.role_id = roles.id;

--7. Вывести имена и должность только Java разработчиков.

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
left join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Java_developer%';

--8. Вывести имена и должность только Python разработчиков.

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
left join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Python_developer%';

--9. Вывести имена и должность всех QA инженеров.

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
left join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%QA_engineer';

--10. Вывести имена и должность ручных QA инженеров.

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
left join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Manual_QA_engineer';

--11. Вывести имена и должность автоматизаторов QA

select employees.employees_name  , roles.role_name  from roles_employee
join employees
on roles_employee.employee_id = employees.id 
right  join roles
on roles_employee.role_id = roles.id
where roles.role_name like '%Automation_QA_engineer';

--12. Вывести имена и зарплаты Junior специалистов

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Java_developer%';

--16. Вывести зарплаты Python разработчиков

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Python_developer%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Junior_Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employees.employees_name,salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Middle_JavaScript_developer%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select employees.employees_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Senior_Java_developer%';

--20. Вывести зарплаты Junior QA инженеров

select salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%' and roles.role_name like '%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as avg_salary_junior  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as sum_salary_js  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%JavaScript_developer%';

--23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as min_salary_QA  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%QA_engineer%';

--24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as max_salary_QA  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%QA_engineer%';

--25. Вывести количество QA инженеров

select count(role_name) as count_QA from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%QA_engineer%';

--26. Вывести количество Middle специалистов.

select count(role_name) as count_Middle from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(role_name) as count_developer from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) as fund_sum_salary_js  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.employees_name, roles.role_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
order by employees.employees_name  ;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employees.employees_name, roles.role_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where monthly_salary < '1700' or monthly_salary > '2300'
order by employees.employees_name;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.employees_name, roles.role_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where monthly_salary < '2300'
order by employees.employees_name;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employees_name, roles.role_name, salary.monthly_salary  from roles_employee_salary
join employees
on roles_employee_salary.employee_id = employees.id 
join roles
on roles_employee_salary.role_id = roles.id
join salary
on roles_employee_salary.salary_id = salary.id
where monthly_salary = '1100' or monthly_salary = '1500' or monthly_salary = '2000'
order by employees.employees_name;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---создаю связующую таблицу roles_salary_2 для ролей и зарплат.

create table roles_salary_2(	
 id serial primary key,
 id_role int not null,
 id_salary int not null,
 foreign key (id_role)
  references roles(id),
 foreign key (id_salary)
  references salary(id) 
);

-- добовляю связь между таблицами по id

insert into roles_salary_2(id_role, id_salary)
values (1, 1),
	   (2, 3),
	   (3, 3),
	   (4, 5),
	   (5, 5),
	   (6, 6),
	   (7, 11),
	   (8, 8),
	   (9, 4),
	   (10, 13),
	   (11, 10),
	   (12, 9),
	   (13, 12),
	   (14, 16),
	   (15, 15);
	  

-- создаю таблицу со связями salary, employees, roles.
	  
create table roles_employee_salary (	
id serial primary key,
employee_id int unique not null ,
role_id int not null,
salary_id int not null,
foreign key (employee_id)
  references employees(id), 
foreign key (salary_id)
  references salary(id),   
foreign key (role_id)
  references roles(id)
);

insert into roles_employee_salary(employee_id, role_id,salary_id)
values
       (3, 14,3),
       (4, 15,4),
       (5, 16,5),
       (6, 11,6),
       (7, 4,7),
       (8, 10,8),
       (9,2,9),
       (10, 1,11),
       (11, 2,12),
       (12, 3,12),
       (13, 4,14),
       (14, 5,14),
       (15, 6,13),
       (16, 7,9),
       (17, 18,15),
       (18, 9,13),
       (19, 10,14),
       (20, 11,11),
       (21, 8,8),
       (22, 15,2),
       (23, 15,1),
       (24, 5,3),
       (25, 3,5),
       (26, 7,6),
       (27, 8,3),
       (28, 19,2),
       (29, 4,1),
       (30, 13,4),
       (31, 1,5),
       (32, 2,7),
       (33, 3,9),
       (34, 4,10),
       (35, 5,15),
       (36, 6,15),
       (37, 7,13),
       (38, 8,15),
       (39, 9,12),
       (40, 10,8);	

      
