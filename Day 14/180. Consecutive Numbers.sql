-- Write your PostgreSQL query statement below
WITH consecutive_numbers AS (
    SELECT 
        num, 
        LEAD(num) OVER (ORDER BY id) AS next_num,
        LEAD(num,2) OVER (ORDER BY id) AS next_next_num
    FROM logs
)

SELECT 
    DISTINCT num AS ConsecutiveNums
FROM consecutive_numbers
WHERE num = next_num AND num = next_next_num