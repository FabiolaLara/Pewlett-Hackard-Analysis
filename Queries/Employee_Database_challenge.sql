SELECT e.emp_no, e.first_name, e. last_name, 
t.title, t.from_date, t.to_date
--INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no 
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Deliverable 1. Step 9
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
rt.first_name, 
rt.last_name,
rt.title
--INTO unique_titles
FROM retirement_titles rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM unique_titles

-- Deliverable 1. Step 9. Step 17
SELECT COUNT(title) AS count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles

--Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT  e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,t.title
--INTO retirement_titles
FROM employees e
INNER JOIN dept_emp de
--ON  employees.emp_no = dept_emp.emp_no;
USING (emp_no)
INNER JOIN titles t
ON de.emp_no = t.emp_no;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,t.title
--INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_emp de
--ON  employees.emp_no = dept_emp.emp_no;
USING (emp_no)
INNER JOIN titles t
--ON de.emp_no = t.emp_no
USING(emp_no)
WHERE (de.to_date ='9999-01-01' AND (e.birth_date BETWEEN '1965_01_01' and '1965-12-31'))
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility















