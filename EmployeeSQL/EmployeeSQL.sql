-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no as employee_number, last_name, first_name,sex,salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees emp
WHERE emp.hire_date LIKE '%/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_m.dept_no AS department_number, departments.dept_name, dept_m.emp_no AS employee_number, employees.last_name, employees.first_name 
FROM dept_manager dept_m
LEFT JOIN departments ON dept_m.dept_no = departments.dept_no
LEFT JOIN employees ON employees.emp_no = dept_m.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_e.dept_no AS department_number, dept_e.emp_no AS employee_number, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employees dept_e
LEFT JOIN departments ON dept_e.dept_no = departments.dept_no
LEFT JOIN employees ON employees.emp_no = dept_e.emp_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex,emp.emp_no
FROM employees emp
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees emp
WHERE emp_no IN 
(
	SELECT emp_no
	FROM dept_employees
	WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, last_name, first_name, departments.dept_name
FROM employees emp
LEFT JOIN dept_employees ON emp.emp_no = dept_employees.emp_no
LEFT JOIN departments ON departments.dept_no = dept_employees.dept_no
WHERE departments.dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count";