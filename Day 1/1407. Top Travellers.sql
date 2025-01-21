-- Write your PostgreSQL query statement below
SELECT 
    users.name,  -- User's name from the Users table.
    COALESCE(SUM(rides.distance),0) as travelled_distance -- Total distance traveled by the user; defaults to 0 if no rides exist.
FROM Users u
FROM Users as users
LEFT JOIN Rides as rides
    ON users.id = rides.user_id
GROUP BY users.id, users.name
ORDER BY 
    travelled_distance DESC, -- Sort by total traveled distance in descending order.
    users.name ASC -- In case of ties, sort alphabetically by user name.