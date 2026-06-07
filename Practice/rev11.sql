/*
use rev1;

CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO employees VALUES
(101,'Amit','HR',40000,'Mumbai','2022-01-15'),
(102,'Neha','IT',65000,'Pune','2021-03-20'),
(103,'Rahul','IT',70000,'Mumbai','2020-07-11'),
(104,'Priya','Finance',55000,'Delhi','2022-05-10'),
(105,'Karan','HR',45000,'Pune','2023-02-18'),
(106,'Sneha','IT',80000,'Mumbai','2019-09-25'),
(107,'Rohan','Sales',50000,'Delhi','2021-11-12'),
(108,'Anjali','Sales',52000,'Mumbai','2020-12-01');

CREATE TABLE departments(
    dept_id INT,
    department VARCHAR(30),
    manager VARCHAR(50)
);

INSERT INTO departments VALUES
(1,'HR','Rakesh'),
(2,'IT','Meera'),
(3,'Finance','Vikas'),
(4,'Sales','Anita');

select * from employees;
select * from departments;

*/

/*
Level 1: SELECT, WHERE
1/Show all employees.
2/Show employee names only.
3/Show employees from Mumbai.
4/Show employees with salary > 60000.
5/Show employees from IT department.
6/Show employees not from Mumbai.
7/Show employees whose salary is between 50000 and 70000.
8/Show employees working in HR or Finance.

Level 2: ORDER BY, LIMIT
9/Show employees sorted by salary ascending.
10/Show employees sorted by salary descending.
11/Show top 3 highest-paid employees.
12/Show youngest employees based on joining date.

Level 3: Aggregate Functions
13/Total employees.
14/Average salary.
15/Maximum salary.
16/Minimum salary.
17/Sum of all salaries.

Level 4: GROUP BY
18/Number of employees in each department.
19/Average salary department-wise.
20/Maximum salary department-wise.
21/Number of employees city-wise.

Level 5: HAVING
22/Departments having more than 2 employees.
23/Departments whose average salary exceeds 60000.
24/Cities having at least 2 employees.

Level 6: String Functions
25/Show employee names in uppercase.
26/Show first 3 letters of employee names.
27/Find employees whose names start with 'A'.
28/Find employees whose names end with 'a'.
29/Find employees whose names contain 'h'.

Level 7: Date Functions
30/Employees joined after 2021.
31/Employees joined in 2022.
32/Calculate years worked by each employee.

Level 8: Join Practice
33/Show employee name and manager.
34/Show all IT employees with manager.
35/Show department and average salary.
36/Show manager of employee Rahul.
37/Show employees whose manager is Meera.

Level 9: Subquery Practice
38/Employee with highest salary.
39/Employee with second highest salary.
40/Employees earning above average salary.
41/Employees earning less than average salary.
42/Employees in same department as Rahul.

Level 10: Window Functions 
43/Rank employees by salary.
44/Dense Rank employees by salary.
45/Row Number employees by salary.
46/Highest paid employee in each department.
47/Second highest salary in each department.
48/Running total of salary.
49/Department-wise salary ranking.
50/Previous employee salary using LAG().
51/Next employee salary using LEAD().

Level 11:Mixed Questions
52/Find duplicate cities.
53/Find departments with no employees.
54/Find employee(s) earning highest salary in each department.
55/Find top 2 salaries department-wise.
56/Find employees hired before their department manager's team average joining date.
57/Find salary difference from department average.
58/Find percentage contribution of each employee's salary to total salary.

*/

/*
 1)select * from employees; 
 2)select emp_name from employees;  
 3)select * from employees where city='Mumbai';  
 4)select * from employees where salary>60000;
 5)select * from employees where department='IT'; 
 6)select * from employees where city!='Mumbai'; 
 7)select * from employees where salary between 50000 and 70000;
 8)select * from employees where department='HR'or department='Finance';  [select * from employees where department='HR' or 'Finance';->Wrong Finance treated as condition]
 9)select * from employees order by salary asc; 
 10)select * from employees order by salary desc; 
 11) select * from employees order by salary desc limit 3; 
 12)select * from employees order by joining_date desc limit 1; [Depends on interpretation,Latest joining date = newest employee ,age column doesn't exist]
 13)select count(*) from employees;  
 14)select avg(salary) from employees; 
 15)select max(salary) from employees; 
 16)select min(salary) from employees; 
 17)select sum(salary) from employees; 
 18)select count(*) as no_of_emp,department from employees group by department;
 19)select avg(salary),department from employees group by department;
 20) select max(salary),department from employees group by department;
 21)select count(*) as no_of_of_emp,city from employees group by city;
 22)select count(*) as no_of_emp,department from employees group by department having count(*)>2; 
 23) select avg(salary),department from employees group by department having avg(salary)>60000; 
 24)select count(*) as no_of_emp,city from employees group by city having count(*)>=2;
 25)select upper(emp_name) from employees;  
 26)select substring(emp_name,1,3) from employees;  
 27) select * from employees where emp_name like 'A%'; 
 28)select * from employees where emp_name like '%a'; 
 29)select * from employees where emp_name like '%h%';
 30)select * from employees where joining_date>='2022-01-01';  
 31)select * from employees where joining_date between '2022-01-01' and '2022-12-31'; 
 32)select *,timestampdiff(year,joining_date,curdate()) as year_worked from employees;
 33)select e.emp_name,e.department,d.manager from employees as e left join departments as d on e.department=d.department; 
 34)select e.emp_name,e.department,d.manager from employees as e left join departments as d on e.department=d.department where e.department='IT'; 
 35) select avg(salary),department from employees group by department;  
 36)select e.emp_name,e.department,d.manager from employees as e left join departments as d on e.department=d.department where e.emp_name='Rahul'; 
 37) select e.emp_name,e.department,d.manager from employees as e left join departments as d on e.department=d.department where d.manager='Meera'; 
 38)select * from employees where salary=(select max(salary) from employees); 
 39)select * from employees where salary= (select max(salary) from employees where salary< (select max(salary) from employees));  [select * from employees order by salary desc limit 1,1;->fails when salaries tie.]
 40)select * from employees where salary>(select avg(salary) from employees); 
 41)select * from employees where salary<(select avg(salary) from employees); 
 42)select * from employees where department=(select department from employees where emp_name='Rahul'); 
 43)select *,rank() over(order by salary desc) as rnk from employees;
 44)select *,dense_rank() over(order by salary desc) as rnk from employees;  
 45)select *,row_number() over(order by salary desc) as rnk from employees;
 46)select emp_name,department,salary from (select *, row_number() over( partition by department order by salary desc ) as rnk from employees) tmp where rnk=1;  [ select emp_name,department from (select *,row_number() over(partition by department) as rnk from employees) as tmp where tmp.rnk=1;->forgot salary ordering.]
 47)select salary,department from ( select *, row_number() over( partition by department order by salary desc ) as rnk from employees) tmp where rnk=2;   [select salary,department from (select *,row_number() over(partition by department) as rnk from employees) as tmp where tmp.rnk=2;->forgot salary ordering.]
 48) select *,sum(salary) over (order by emp_id asc) as running_total from employees;
 49)select *,row_number() over(partition by departmentorder by salary desc) as rnk from employees;   [select *,row_number() over(partition by department) as rnk from employees; ->forgot ordering]
 50)select * ,lag(salary,1,0) over(order by salary desc) from employees;
 51)select * ,lead(salary,1,0) over(order by salary desc) from employees;
 52)select count(*),city from employees group by city having count(*)>=2;
 53)select d.department from departments d left join employees e on d.department=e.department where e.emp_id is null;  [select count(emp_id),department from employees group by department having count(emp_id)=0;->Because department appears only if at least one employee exists.Need LEFT JOIN]
 54)select emp_name,department from (select *,row_number()over(partition by departmentorder by salary desc) as rnk from employees) as tmp where tmp.rnk=1; [select emp_name,department from (select *,row_number() over(partition by department) as rnk from employees) as tmp where tmp.rnk=1;->forgot salary ordering]
 55)with RankedSalaries as ( select department,emp_name,salary,dense_rank() over(partition by department order by salary desc) as salary_rank from employees) select department,salary from RankedSalaries where salary_rank<=2; 
 56)select * from employees e where joining_date < (select avg_date from(select department,avg(to_days(joining_date)) as avg_days,from_days(avg(to_days(joining_date))) as avg_date from employees group by department) x where x.department=e.department);
 57)select department ,emp_name,salary,round(avg(salary) over(partition by department),2) as dept_avg,round(salary-avg(salary) over(partition by department),2) as salary_diff from employees order by department,salary desc; 
 58)select emp_name,salary,round((salary/sum(salary) over())*100,2) as pct_of_company_total from employees order by salary desc;
 
 */
 