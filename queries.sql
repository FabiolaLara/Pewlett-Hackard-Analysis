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
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	   
	   
--See the created table "retirement_info"
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
-- INNER JOIN	   
SELECT departments.dept_name,
dept_manager.emp_no,
dept_manager.from_date,
dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;
	   
-- Joining retirement_info and dept_emp tables
-- LEFT JOIN
SELECT retirement_info.emp_no,
retirement_info.first_name,
retirement_info.last_name,
dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;	

--Use Aliases for Code Readability
SELECT ri.emp_no,
ri.first_name,
ri.last_name,
de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;	   

SELECT * FROM current_emp	   
	   
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
 dept_manager.emp_no,
 dept_manager.from_date,
 dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;	

--Use Left Join for retirement_info and dept_emp tables with alias
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date	   
INTO current_emp	   
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM current_emp	
	   
-- Joining departments and dept_manager tables using alias
SELECT d.dept_name,
dm.emp_no,
dm.from_date,
dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;	
	   
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

SELECT * FROM current_emp	   
	   
-- Creating the table emp_dep
-- count, dep_no, emp_no, current_emp as ce, dept_emp as de
	   
--SELECT COUNT(ce.emp_no), de.dept_no, de.emp_no
--INTO emp_dep

--FROM current_emp as ce
--LEFT JOIN dept_emp as de
--ON ce.emp_no = de.emp_no
--GROUP BY de.dept_no
--ORDER BY de.dept_no;	 

	   
-- Employee count by department number 
-- emp_dep table	   
SELECT COUNT(ce.emp_no), de.dept_no
INTO emp_dep
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;	
	
SELECT * FROM emp_dep	   
SELECT * FROM departments	   
	   
--Canvas 7.3.5 LIST 1 EMPLOYEE INFORMATION
SELECT * FROM salaries;
	   
SELECT * FROM salaries
ORDER BY to_date DESC;	   
-- Creating emp_info (temporary table)
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	   
	   
SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
	de.to_date	   
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)	   

INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)	   
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');	   

SELECT * FROM emp_info;
	   
--List 2: Management
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);	   
SELECT * FROM manager_info;
	
--List 3 Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	   
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);	   
	   
	   
--7.3.6 Create a Tailored List SKILL DRILL
--Employee numbers
--Employee first name
--Employee last name
--Employee department name	   

SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   de.emp_no,
	   dept_name
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)	   
INNER JOIN departments d
ON (d.dept_no = de.dept_no)
	

	   
	   
	   --7.3.6 Create a Tailored List SKILL DRILL
	   -- For SALES and DEVELOPMENT teams
--Employee numbers
--Employee first name
--Employee last name
--Employee department name
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   de.emp_no,
	   d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)	   

INNER JOIN departments d
ON (d.dept_no = de.dept_no)
WHERE dept_name = 'Sales'	
OR dept_name = 'Development'
	   
--GROUP BY d.dept_name
--ORDER BY d.dept_name;	 
	   	   
	   
	   
--Just checking info in departments table	   
SELECT * FROM departments
WHERE dept_name IN ('Sales', 'Development')	   
	   
SELECT * FROM departments
WHERE dept_name = 'Sales'	
OR dept_name = 'Development'	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   