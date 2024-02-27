-- Drop table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;



-- Create the departments table
create table departments (
    dept_no varchar(4) primary key,
    dept_name varchar(45)
);

-- Create the employees table
create table employees (
    emp_no serial primary key,
    emp_title_id varchar(5), -- Adjust the length based on the data type in titles table
    birth_date varchar(45),
    first_name varchar(45),
    last_name varchar(45),
    sex char(1),
    hire_date varchar(45)
);

-- Create the dept_emp table
create table dept_emp (
    emp_no int, -- Assuming emp_no is an integer
	dept_no varchar(4),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

);

-- Create the dept_manager table
create table dept_manager (
    dept_no varchar(4),
    emp_no int, -- Assuming emp_no is an integer
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the salaries table
create table salaries (
    emp_no int,
    salary int,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the titles table
create table titles (
    titleid varchar(5) primary key,
    title varchar(45)
);

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles



