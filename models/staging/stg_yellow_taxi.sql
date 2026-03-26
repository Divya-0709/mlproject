WITH source AS (
    SELECT * FROM taxi_db.raw_yellow_taxi
),
cleaned AS (
    SELECT
        VendorID                                     AS vendor_id,
        tpep_pickup_datetime                         AS pickup_at,
        tpep_dropoff_datetime                        AS dropoff_at,
        TIMESTAMPDIFF(MINUTE, tpep_pickup_datetime,
                      tpep_dropoff_datetime)         AS trip_duration_min,
        passenger_count,
        ROUND(trip_distance, 2)                      AS trip_distance_miles,
        PULocationID                                 AS pickup_zone_id,
        DOLocationID                                 AS dropoff_zone_id,
        payment_type,
        ROUND(fare_amount, 2)                        AS fare_amount,
        ROUND(tip_amount, 2)                         AS tip_amount,
        ROUND(total_amount, 2)                       AS total_amount
    FROM source
    WHERE total_amount > 0
      AND trip_distance > 0
)
SELECT * FROM cleaned