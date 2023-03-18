-- 1) Создать таблицу employees
--    id. serial,  primary key,
--    employee_name. Varchar(50), not null

create table employees (	
id serial primary key,
employees_name varchar(50) unique not null
);


-- 2)	Наполнить таблицу employee 70 строками.

insert into employees(employees_name)
values  ('Alexander_Mayer'),
		('Edward_Esparza'),
		('Joshua_Keller'),
		('Jeremy_Santiago'),
		('Elijah_Boyd'),
		('Benjamin_Rosario'),
		('Bryan_Torres'),
		('Wayne_Hinton'),
		('Joshua_Rodriguez'),
		('Walter_Callahan'),
		('Terry_Tapia'),
		('Dylan_Dominguez'),
		('Keith_Wall'),
		('Nicholas_Fowler'),
		('John_Aguilar'),
		('Austin_Khan'),
		('Nathan_Simmons'),
		('Carl_Livingston'),
		('Donald_Morrison'),
		('Adam_Erickson'),
		('Walter_Clayton'),
		('Douglas_Fitzgerald'),
		('Paul_Enriquez'),
		('Harold_Hobbs'),
		('Eugene_Sandoval'),
		('Larry_Parks'),
		('Russell_Avery'),
		('Peter_Morrison'),
		('Bryan_Chavez'),
		('Michael_Howe'),
		('Joseph_Melton'),
		('Nathan_Welch'),
		('Kenneth_White'),
		('Mark_Dougherty'),
		('Matthew_Neal'),
		('Kevin_Romero'),
		('Gary_Dawson'),
		('Keith_Felix'),
		('Gregory_Evans'),
		('Lawrence_Fletcher'),
		('Harold_Montgomery'),
		('Harold_Stone'),
		('Kevin_Padilla'),
		('Robert_Franco'),
		('Timothy_West'),
		('Brian_Meadows'),
		('Nathan_Marshall'),
		('Arthur_Hampton'),
		('Samuel_Weeks'),
		('Harold_Bean'),
		('Stephen_Wilcox'),
		('Randy_Lester'),
		('Philip_Kaur'),
		('Austin_Bishop'),
		('Juan_Harrison'),
		('Bryan_Ayala'),
		('Charles_Wyatt'),
		('Albert_Turner'),
		('Christian_Golden'),
		('Louis_Walters'),
		('Gregory_Vaughn'),
		('Dennis_Lozano'),
		('Keith_Snow'),
		('Larry_Carr'),
		('Ronald_Guerrero'),
		('Vincent_Hawkins'),
		('James)_Harding'),
		('Walter_Richardson'),
		('Joshua_Bailey'),
		('Jason_Dalton');


-- 3) Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null


create table salary (	
id serial primary key,
monthly_salary int not null
);

-- 4) Наполнить таблицу salary 15 строками:

insert into salary(monthly_salary)
values (1000),
 	   (1100),
 	   (1200),
 	   (1300),
 	   (1400),
 	   (1500),
 	   (1600),
 	   (1700),
 	   (1800),
 	   (1900),
 	   (2000),
 	   (2100),
 	   (2200),
 	   (2300),
 	   (2400),
 	   (2500);
 	   


-- 5) Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null


create table employee_salary (	
id serial primary key,
employee_id int unique not null ,
salary_id int not null,
foreign key (employee_id)
  references employees(id),
foreign key (salary_id)
  references salary(id)
);

-- 6) Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
-- (Базу реляционная, она не даст добавить несуществующие ID т.к их нет в таблице employees ) 

DROP TABLE employee_salary;
insert into employee_salary(employee_id, salary_id)
values (1, 11),
       (2, 12),
       (3, 14),
       (4, 15),
       (5, 16),
       (6, 11),
       (7, 4),
       (8, 10),
       (9,2),
       (10, 1),
       (11, 2),
       (12, 3),
       (13, 4),
       (14, 5),
       (15, 6),
       (16, 7),
       (17, 8),
       (18, 9),
       (19, 10),
       (20, 11),
       (21, 8),
       (22, 15),
       (23, 15),
       (24, 5),
       (25, 3),
       (26, 7),
       (27, 8),
       (28, 9),
       (29, 4),
       (30, 13);
       

--7) Создать таблицу roles
--   id. Serial  primary key,
--   role_name. int, not null, unique


      
create table roles (	
id serial primary key,
role_name int unique not null
);      
      
 
--8) Поменять тип столба role_name с int на varchar(30)

alter table roles
alter column role_name type varchar(30) using role_name::varchar(30);


--9) Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values  ('Junior_Python_developer'),
		('Middle_Python_developer'),
		('Senior_Python_developer'),
		('Junior_Java_developer'),
		('Middle_Java_developer'),
		('Senior_Java_developer'),
		('Junior_JavaScript_developer'),
		('Middle_JavaScript_developer'),
		('Senior_JavaScript_developer'),
		('Junior_Manual_QA_engineer'),
		('Middle_Manual_QA_engineer'),
		('Senior_Manual_QA_engineer'),
		('Project_Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales_manager'),
		('Junior_Automation QA engineer'),
		('Middle_Automation QA engineer'),
		('Senior_Automation QA engineer');

	
--10) Создать таблицу roles_employee
--     id. Serial  primary key,
--     employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--     role_id. Int, not null (внешний ключ для таблицы roles, поле id)
	
create table roles_employee (	
id serial primary key,
employee_id int unique not null ,
role_id int not null,
foreign key (employee_id)
  references employees(id),
foreign key (role_id)
  references roles(id)
);
select * from roles_employee;	
	
--11)	Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id, role_id)
values (1, 11),
       (2, 12),
       (3, 14),
       (4, 15),
       (5, 16),
       (6, 11),
       (7, 4),
       (8, 10),
       (9,2),
       (10, 1),
       (11, 2),
       (12, 3),
       (13, 4),
       (14, 5),
       (15, 6),
       (16, 7),
       (17, 8),
       (18, 9),
       (19, 10),
       (20, 11),
       (21, 8),
       (22, 15),
       (23, 15),
       (24, 5),
       (25, 3),
       (26, 7),
       (27, 8),
       (28, 9),
       (29, 4),
       (30, 13),
       (31, 1),
       (32, 2),
       (33, 3),
       (34, 4),
       (35, 5),
       (36, 6),
       (37, 7),
       (38, 8),
       (39, 9),
       (40, 10);	
	
