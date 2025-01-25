-- Write your PostgreSQL query statement below
WITH highest_temperature AS (
    SELECT 
        id, 
        recordDate,
        temperature,
        LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date,
        LAG(temperature) OVER (ORDER BY recordDate) AS previous_temperature
    FROM weather
)

SELECT 
    id
FROM highest_temperature
WHERE previous_date = recordDate - INTERVAL '1 day' 
    AND temperature > previous_temperature 