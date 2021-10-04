-- Part 1: Data Engineering --

-- View the tables --
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

-- Create tables to hold data from csv files
-- Create columns and specify data type
CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL,
	dept_name VARCHAR (30) NOT NULL);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_no VARCHAR (30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL);

CREATE TABLE titles (
	title_id VARCHAR (10) NOT NULL,
	title VARCHAR (30) NOT NULL);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL);

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL);
	
-- Connect tables by adding CONSTRAINTs 


