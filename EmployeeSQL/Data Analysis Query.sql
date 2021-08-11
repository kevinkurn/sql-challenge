--1.  List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT  emp.employee_id,emp.last_name,emp.first_name,emp.sex,sal.salary
FROM employees AS emp
JOIN salaries AS sal ON
sal.employee_id=emp.employee_id
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE RIGHT(hire_date,4)='1986'
;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT mgr.department_id, dept.department_name,mgr.employee_id,emp.last_name,emp.first_name
FROM department_manager AS mgr
JOIN "Departments" AS dept ON dept.department_id=mgr.department_id
JOIN employees AS emp ON emp.employee_id=mgr.employee_id
;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT d_emp.employee_id,emp.last_name,emp.first_name, dept.department_name
FROM department_employees AS d_emp
JOIN employees AS emp ON d_emp.employee_id=emp.employee_id
LEFT JOIN "Departments" AS dept ON d_emp.department_id=dept.department_id
;

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.
SELECT d_emp.employee_id,emp.last_name,emp.first_name,d_emp.department_id, dept.department_name
FROM department_employees AS d_emp
JOIN employees AS emp ON d_emp.employee_id=emp.employee_id
LEFT JOIN "Departments" AS dept ON d_emp.department_id=dept.department_id
WHERE dept.department_name='Sales'
;

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT d_emp.employee_id,emp.last_name,emp.first_name,d_emp.department_id, dept.department_name
FROM department_employees AS d_emp
JOIN employees AS emp ON d_emp.employee_id=emp.employee_id
LEFT JOIN "Departments" AS dept ON d_emp.department_id=dept.department_id
WHERE dept.department_name='Sales' OR dept.department_name='Development'
;

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "no. of occurences"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC
;