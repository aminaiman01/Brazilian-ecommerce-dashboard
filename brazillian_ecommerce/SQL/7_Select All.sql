SELECT * FROM brazilian_ecommerce_cleaned


SELECT SUM(price) FROM brazilian_ecommerce_cleaned

-- 👉 Total Revenue with Year, State, and Payment Method for slicers
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,   -- slicer 1
    geolocation_state_customer AS customer_state,                -- slicer 2
    payment_type,                                                -- slicer 3
    ROUND(SUM(price), 2) AS total_revenue
FROM 
    brazilian_ecommerce_cleaned
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_year, customer_state, payment_type
ORDER BY 
    order_year, total_revenue DESC;



12462927.41