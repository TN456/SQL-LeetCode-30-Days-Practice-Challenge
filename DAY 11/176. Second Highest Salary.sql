-- Write your PostgreSQL query statement below
WITH RankedSalaries AS (
    SELECT 
        DISTINCT salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employee
)

SELECT 
    COALESCE(
        (SELECT salary
        FROM RankedSalaries
        WHERE rank = 2), 
    NULL
    )
AS "SecondHighestSalary"