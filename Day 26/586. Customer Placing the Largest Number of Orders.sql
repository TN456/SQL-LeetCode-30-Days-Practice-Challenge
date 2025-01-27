-- Write your PostgreSQL query statement below
WITH customer_largest_order AS (
    SELECT 
        customer_number,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
    FROM orders
    GROUP BY customer_number
)
SELECT 
    customer_number
FROM customer_largest_order
WHERE rank = 1;