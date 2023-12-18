-- create departments table

CREATE TABLE departments (
    dept_no VARCHAR(35)   NOT NULL,
    dept_name VARCHAR(35)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);
select * from departments;
-- create department employee table

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(35)   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

select * from dept_emp;

-- -- create department manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(35)   NOT NULL,
    emp_no INTEGER   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

select * from dept_manager;
-- -- create employee table

CREATE TABLE employees (
    emp_no INTEGER  NOT NULL,
    emp_title_id VARCHAR(35)   NOT NULL,
    birth_date DATE(12)  NOT NULL,
    first_name VARCHAR(35)   NOT NULL,
    last_name VARCHAR(35)   NOT NULL,
    sex VARCHAR(35)   NOT NULL,
    hire_date DATE(12)   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id)	REFERENCES titles(title_id)
);

select * from employees;

 -- create salaries table
 
CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL PRIMARY KEY,
    salary INTEGER   NOT NULL
);

select * from salaries;

-- create titles table
CREATE TABLE titles (
    title_id VARCHAR(35)   NOT NULL,
    title VARCHAR(35)   NOT NULL,
    PRIMARY KEY (title_id),
	FOREIGN KEY(emp_no)REFERENCES employees (emp_no)
);

select * from titles;







