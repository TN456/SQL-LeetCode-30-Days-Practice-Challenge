-- Write your PostgreSQL query statement below
-- Select product IDs and names sold only in Q1 2019
SELECT DISTINCT
    product.product_id,
    product.product_name
FROM product
JOIN sales
    ON product.product_id = sales.product_id 
WHERE 
    sale_date BETWEEN '2019-01-01' AND '2019-03-31'
     -- Exclude products with sales outside Q1 2019
    AND NOT EXISTS (
        SELECT 1
        FROM sales s
        WHERE s.product_id = product.product_id
        AND s.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
    )