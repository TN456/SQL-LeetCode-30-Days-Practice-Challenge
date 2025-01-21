-- CTE to calculate total trips and canceled trips per day
WITH cancellation_rate AS (
    SELECT 
        trips.request_at,  -- Trip date
        COUNT(trips.id) AS total_trips,  -- Total trips per day
        COUNT(CASE WHEN trips.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 END) AS canceled_trips  -- Canceled trips per day
    FROM Trips AS trips
    INNER JOIN Users AS client
        ON trips.client_id = client.users_id
        AND client.banned = 'No'
    INNER JOIN Users AS driver
        ON trips.driver_id = driver.users_id
        AND driver.banned = 'No'
    WHERE trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY trips.request_at
)

-- Calculate cancellation rate and display results
SELECT 
    request_at AS "Day",  -- Trip date
    ROUND(CAST(canceled_trips AS NUMERIC) / total_trips, 2) AS "Cancellation Rate"  -- Cancellation rate rounded to 2 decimal places
FROM cancellation_rate;
