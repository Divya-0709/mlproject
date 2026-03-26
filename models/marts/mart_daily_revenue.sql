WITH base AS (
    SELECT * FROM {{ ref('stg_yellow_taxi') }}
)
SELECT
    DATE(pickup_at)                         AS trip_date,
    COUNT(*)                                AS total_trips,
    ROUND(SUM(total_amount), 2)             AS gross_revenue,
    ROUND(AVG(total_amount), 2)             AS avg_fare,
    ROUND(AVG(tip_amount), 2)               AS avg_tip,
    ROUND(SUM(trip_distance_miles), 2)      AS total_miles,
    ROUND(AVG(trip_duration_min), 2)        AS avg_duration_min
FROM base
GROUP BY DATE(pickup_at)
ORDER BY trip_date