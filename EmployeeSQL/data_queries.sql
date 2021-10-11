-- Part 2: Data Analysis -----------------------------------------------------------
-- Data Queries --------------------------------------------------------------------

-- 1. List the following details of each employee: 
------employee number, last name, first name, sex, and salary.

SELECT e.emp_no AS "employee number", e.last_name AS "last name",
		e.first_name AS "first name", e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name AS "first name", last_name AS "last name", hire_date AS "hired date"
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department with the following information:
------department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no AS "department number", d.dept_name AS "department name", 
		dm.emp_no AS "manager employee number", e.first_name AS "first name", e.last_name AS "last name"
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
------employee number, last name, first name, and department name.

SELECT e.first_name AS "first name", e.last_name AS "last name", d.dept_name AS "department name"
FROM employees AS e
JOIN dept_emp AS dm
ON e.emp_no = dm.emp_no
JOIN departments AS d
ON dm.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name 
------is "Hercules" and last names begin with "B".

SELECT first_name AS "first name", last_name AS "last name", sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
------employee number, last name, first name, and department name.

SELECT e.first_name AS "first name", e.last_name AS "last name", d.dept_name AS "department name"
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no= de.emp_no
JOIN departments AS d
ON de.dept_no= d.dept_no
WHERE d.dept_name ='Sales';

-- 7. List all employees in the Sales and Development departments,
------including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "employee number", e.first_name AS "first name", e.last_name AS "last name",
 		d.dept_name AS "department name"
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no= de.emp_no
JOIN departments AS d
ON de.dept_no= d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
------i.e., how many employees share each last name.

SELECT last_name AS "last name", COUNT (last_name) AS "lastname count"
FROM employees
GROUP BY last_name
ORDER BY "lastname count" DESC;
