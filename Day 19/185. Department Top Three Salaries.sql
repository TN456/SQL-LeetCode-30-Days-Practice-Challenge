-- Write your PostgreSQL query statement below
WITH department_salary AS (
    SELECT 
        department.name AS "Department", 
        employee.name AS "Employee",
        employee.salary AS "Salary",
        DENSE_RANK() OVER (PARTITION BY employee.departmentId ORDER BY employee.salary DESC) AS rank
    FROM employee
    JOIN department 
        ON employee.departmentId = department.id
)

SELECT 
    "Department",
    "Employee",
    "Salary"
FROM department_salary
WHERE rank IN (1, 2, 3);