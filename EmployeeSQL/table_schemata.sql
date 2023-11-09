-- Creating department table

CREATE TABLE departments (
		dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
		dept_name VARCHAR(20) NOT NULL
);

-- Check data import
SELECT * 
FROM department;




-- Creating dep_emp table

CREATE TABLE dept_emp (
		emp_no INT PRIMARY KEY NOT NULL,
		dept_no VARCHAR(6) NOT NULL
        foreign key (dept_no) references departments (dept_no)
);

-- Check data import
SELECT * 
FROM dept_emp;




-- Creating dep_manager table

CREATE TABLE dept_manager (
		dept_no VARCHAR(6) NOT NULL,
		emp_no INT NOT NULL,
        foreign key (dept_no) references departments (dept_no),
        foreign key (emp_no) references dept_emp (emp_no)
);

-- Check data import
SELECT *
FROM dep_manager;




-- Creating employees table

CREATE TABLE employees (
		emp_no INT NOT NULL,
		emp_title_id VARCHAR(6) NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR(20) NOT NULL,
		last_name VARCHAR(20) NOT NULL,
		sex VARCHAR(1) NOT NULL,
		hire_date DATE NOT NULL,
        foreign key (emp_no) references dept_emp (emp_no)
);

-- Check data import
SELECT *
FROM employees;




-- Creating salaries table

CREATE TABLE salaries (
		emp_no INT NOT NULL,
		salary INT NOT NULL,
        foreign key (emp_no) references dept_emp (emp_no)
);

-- Check data import
SELECT *
FROM salaries;




-- Creating titles table

CREATE TABLE titles (
		title_id VARCHAR(6) NOT NULL,
		title VARCHAR(20) NOT NULL
);

-- Check data import
SELECT *
FROM titles;




