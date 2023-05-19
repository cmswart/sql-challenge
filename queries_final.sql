--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '01-01-1986' and '01-01-1987'
;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no
;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS d_emp
	INNER JOIN departments AS d
		ON (d_emp.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (d_emp.emp_no = e.emp_no)
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE 
	first_name = 'Hercules' 
	AND last_name LIKE 'B%'
;
	
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN 
	(	
	SELECT emp_no 
	FROM dept_emp
	WHERE dept_no IN
		(
		SELECT dept_no 
		FROM departments
		WHERE dept_name = 'Sales')
);

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp AS de
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
	INNER JOIN employees AS e
		on (e.emp_no = de.emp_no)
WHERE d.dept_name IN ('Sales', 'Development')
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT (last_name) AS count_ln
FROM employees
GROUP BY last_name
ORDER BY count_ln DESC
;