Select * from dept_manager
SELECT * from departments
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles
SELECT * FROM dept_emp

CREATE TABLE dept_emp(
dept_no VARCHAR(4) NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
PRIMARY KEY (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no))

--DROP TABLE
-- DROP TABLE employees tells Postgres that we want to remove the Employees table from the database completely.
-- CASCADE; indicates that we also want to remove the connections to other tables in the database.
DROP TABLE employees CASCADE;

--Born between 1952 and 1955 will begin to retire
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Create another query that will search for only 1952 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--Narrow the Search for Retirement Eligibility
-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31);
	  
	   -- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	   
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	   
	 
--Exporting. The data is saved as a new table completely
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	   
	   
--See the created table "retirement_info"
SELECT * FROM retirement_info;

	   