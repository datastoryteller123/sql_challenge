-- 1. List the following details of each employee: employee number, 
-- 	last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, 
	employees.first_name, employees.sex, salaries.salary
FROM Employees
JOIN Salaries on 
	salaries.emp_no = employees.emp_no;

-- 2. List first name, last name, and hire date
-- 	for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, 
	employees.hire_date
FROM Employees
WHERE 
	hire_date 
	BETWEEN '1986-1-1'
 	and '1986-12-31';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.

SELECT department_manager.dept_no, departments.dept_name,
	department_manager.emp_no, employees.last_name, 
	employees.first_name
FROM department_manager
JOIN Departments on 
	departments.dept_no = department_manager.dept_no
JOIN Employees on 
	employees.emp_no = department_manager.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT Employees.emp_no, Employees.last_name, 
	Employees.first_name, departments.dept_name
FROM Employees
JOIN Department_Employee on 
	department_employee.emp_no = Employees.emp_no
JOIN Departments on 
	department_employee.dept_no = departments.dept_no

-- 5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."

SELECT Employees.last_name, Employees.first_name, Employees.sex
FROM Employees
WHERE 
	first_name = 'Hercules' 
	and last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT department_employee.emp_no, Employees.last_name, Employees.first_name, departments.dept_name
FROM Department_Employee
JOIN Departments on 
	department_employee.dept_no = departments.dept_no
JOIN Employees on 
	employees.emp_no = department_employee.emp_no
WHERE departments.dept_name ='Sales';

-- 7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

SELECT department_employee.emp_no, Employees.last_name, Employees.first_name, departments.dept_name
FROM Department_Employee
JOIN Departments on 
	department_employee.dept_no = departments.dept_no
JOIN Employees on 
	employees.emp_no = department_employee.emp_no
WHERE 
	departments.dept_name ='Sales' 
	or departments.dept_name ='Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT last_name,
	COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT DESC;
