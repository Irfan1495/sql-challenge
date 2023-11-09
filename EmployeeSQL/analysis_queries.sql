-- 1) List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	e.emp_no, e.last_name, e.first_name, e.sex,
	(SELECT s.salary FROM salaries As s
	 WHERE e.emp_no = s.emp_no) As salary
FROM employees As e;



-- 2) List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
	first_name, last_name, hire_date
FROM employees
	WHERE extract(YEAR FROM hire_date) = 1986



-- 3) List the manager of each department along with their department number, department name, 
    -- employee number, last name, and first name.

SELECT
		d.dept_no ,d.dept_name ,e.emp_title_id ,e.last_name ,e.first_name
FROM 	dept_emp as de
		LEFT JOIN employees as e
					ON e.emp_no = de.emp_no
		LEFT JOIN departments as d
					ON d.dept_no = de.dept_no
WHERE e.emp_title_id LIKE 'm%';



-- 4) List the department number for each employee along with that employee’s employee number,
        --last name, first name, and department name.

SELECT 
    DISTINCT ON (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees As e
    LEFT JOIN dept_emp As de
    ON e.emp_no = de.emp_no
    INNER JOIN departments As d
    ON de.dept_no = d.dept_no
ORDER BY e.emp_no, de.to_date DESC
;



-- 5) List first name, last name, and sex of each employee whose first name is Hercules 
      -- and whose last name begins with the letter B.

SELECT
		first_name, last_name, sex
FROM employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
;



-- 6) List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM	employees AS e
	INNER JOIN dept_emp AS de
	on e.emp_no = de.emp_no
	INNER JOIN departments AS d
	on de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales'
;



-- 7)

SELECT 
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees As e
    INNER JOIN current_dept_emp AS cde
    ON e.emp_no = cde.emp_no
    INNER JOIN departments AS d
    ON cde.dept_no = d.dept_no
WHERE (lower(d.dept_name) = 'sales') OR (lower(d.dept_name) = 'development');



-- 8) List the frequency counts, in descending order, of all the employee last names 
        --(that is, how many employees share each last name).

SELECT 
	last_name, COUNT(last_name) AS Frequency 
FROM employees 
	GROUP BY last_name
	ORDER BY frequency DESC
	;









