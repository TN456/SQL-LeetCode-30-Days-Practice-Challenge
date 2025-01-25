-- Write your PostgreSQL query statement below
WITH duplicate_emails AS (
    SELECT 
        id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS row
    FROM person
)

DELETE FROM person 
WHERE id IN (
    SELECT id
    FROM duplicate_emails
    WHERE row > 1
)