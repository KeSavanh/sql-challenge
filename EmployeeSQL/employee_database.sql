-- Part 1: Data Engineering ------------------------------------

-- View the tables --
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM employees;
SELECT * FROM titles;

-- Create tables to hold data from csv files
-- Create columns and specify data type
CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL,
	dept_name VARCHAR (30) NOT NULL,
	-- set department number as a primary key in this table
	CONSTRAINT pk_departments PRIMARY KEY (dept_no));

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_no VARCHAR (30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	-- set employer number as a primary key in this table
	CONSTRAINT pk_employees PRIMARY KEY (emp_no));

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	-- set employer number as a primary key in this table
	CONSTRAINT pk_salaries PRIMARY KEY (emp_no));

CREATE TABLE titles (
	title_id VARCHAR (10) NOT NULL,
	title VARCHAR (30) NOT NULL,
	-- set title id as a primary key in this table
	CONSTRAINT pk_titles PRIMARY KEY (title_id));

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL);

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL);
	
-- Set foriegn keys in other tables
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no 
FOREIGN KEY (emp_no) REFERENCES salaries (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no 
FOREIGN KEY (emp_no) REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id 
FOREIGN KEY (emp_title_id) REFERENCES title (title_id);

