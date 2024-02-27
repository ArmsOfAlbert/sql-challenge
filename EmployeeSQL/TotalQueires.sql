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



--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name, de.dept_no
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
