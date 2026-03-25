SELECT 
    VendorID,
    COUNT(*) AS total_trips,
    ROUND(AVG(total_amount), 2) AS avg_fare,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM raw_yellow_taxi
GROUP BY VendorID