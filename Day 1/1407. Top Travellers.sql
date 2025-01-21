-- Write your PostgreSQL query statement below
SELECT 
    users.name,
    COALESCE(SUM(rides.distance),0) as travelled_distance 
FROM Users as users
LEFT JOIN Rides as rides
    ON users.id = rides.user_id
GROUP BY users.id, users.name
ORDER BY travelled_distance DESC, users.name ASC