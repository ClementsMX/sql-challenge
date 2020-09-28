--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no employee_num,
emp.last_name,
emp.first_name,
emp.sex,
cast(sal.salary as money) salary
FROM Employees emp
INNER JOIN Salaries sal ON
emp.emp_no = sal.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp.first_name,
emp.last_name,
emp.hire_date,
extract(year from emp.hire_date) year_num
FROM Employees emp
WHERE extract(year from emp.hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT 
dep.dep_no, 
dep.dept_name,
emp.emp_no, 
emp.last_name, 
emp.first_name
FROM Employees emp
INNER JOIN dept_manager dm ON
emp.emp_no = dm.emp_no
INNER JOIN Departments dep ON
dm.dept_no = dep.dep_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name,
dep.dept_name
FROM Employees emp
INNER JOIN dept_emp dm ON
emp.emp_no = dm.emp_no
INNER JOIN Departments dep ON
dm.dep_no = dep.dep_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT emp.first_name,
emp.last_name,
emp.sex
FROM Employees emp
WHERE emp.first_name = 'Hercules'
AND emp.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name,
dep.dept_name
FROM Employees emp
INNER JOIN dept_emp dm ON
emp.emp_no = dm.emp_no
INNER JOIN Departments dep ON
dm.dep_no = dep.dep_no
WHERE dep.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
emp.emp_no, 
emp.last_name, 
emp.first_name,
dep.dept_name
FROM Employees emp
INNER JOIN dept_emp dm ON
emp.emp_no = dm.emp_no
INNER JOIN Departments dep ON
dm.dep_no = dep.dep_no
WHERE (dep.dept_name = 'Sales' or dep.dept_name = 'Development') ;


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
emp.last_name,
COUNT(emp.last_name) frequency
FROM Employees emp
GROUP BY emp.last_name
ORDER BY 2 DESC;


------extra queries 
select COUNT(*)
from Employees

select *
from Employees
where emp_no = 499942

SELECT tl.title,
cast(avg(sal.salary) as money) salary
FROM Employees emp
INNER JOIN Salaries sal ON
emp.emp_no = sal.emp_no
INNER JOIN titles tl ON
emp.emp_title_id = tl.title_id 
group by tl.title;

SELECT emp.emp_no employee_num,
emp.last_name,
emp.first_name,
emp.sex,
tl.title,
cast(sal.salary as money) salary
FROM Employees emp
INNER JOIN Salaries sal ON
emp.emp_no = sal.emp_no
INNER JOIN titles tl ON
emp.emp_title_id = tl.title_id 
where emp.emp_no = 499942;