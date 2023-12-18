-- List the employee number, last name, first name, sex, 
-- and salary of each employee 
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no
ORDER BY 1;


-- List the first name, last name, and hire date for the 
-- employees who were hired in 1986 
SELECT first_name, last_name
FROM employees 
WHERE EXTRACT(year from hire_date) = 1986;




-- List the manager of each department along with their 
-- department number, department name, employee number,
-- last name, and first name 
SELECT DISTINCT ON (dm.dept_no)d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments as d
INNER JOIN dept_manager AS dm ON
d.dept_no = dm.dept_no
INNER JOIN employees AS e ON
dm.emp_no = e.emp_no
ORDER BY dm.dept_no;



-- List the department number for each employee along with 
-- that employee’s employee number, last name, first name, 
-- and department name 

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name,d.dept_name
FROM departments AS d
LEFT JOIN dept_emp AS de
ON d.dept_no = de.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no;



-- List first name, last name, and sex of each employee whose
-- first name is Hercules and whose last name begins with the
-- letter B 

SELECT e.last_name, e.first_name, e.sex
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%');



-- List each employee in the Sales department, including their 
-- employee number, last name, and first name 
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY 1;


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and
-- department name 

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY 1;

-- List the frequency counts, in descending order, of all the 
-- employee last names (that is, how many employees share each
-- last name) 
SELECT last_name, count(last_name)
FROM employees
GROUP BY 1
ORDER BY 2 DESC;

