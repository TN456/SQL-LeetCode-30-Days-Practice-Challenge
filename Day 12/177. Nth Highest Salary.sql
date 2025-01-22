CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT 
        MAX(rank_salary.salary) as getNthHighestSalary
    FROM(
        SELECT 
            DISTINCT employee.salary,
            DENSE_RANK() OVER (ORDER BY employee.salary DESC) as rank
        FROM employee
    ) AS rank_salary 
    WHERE rank_salary.rank = N
    LIMIT 1
  );
END;
$$ LANGUAGE plpgsql;