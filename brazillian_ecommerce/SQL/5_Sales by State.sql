-- 👉 Useful for a map or bar chart in Excel.

SELECT 
    geolocation_state_customer AS state,
    ROUND(SUM(price),2) AS total_revenue,
    COUNT(DISTINCT customer_unique_id) AS num_customers
FROM brazilian_ecommerce_cleaned
GROUP BY geolocation_state_customer
ORDER BY total_revenue DESC


-- 👉 Sales by State (with Year, State, Payment Method for slicers)

SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,   -- slicer 1
    geolocation_state_customer AS customer_state,                -- slicer 2
    payment_type,                                                -- slicer 3
    ROUND(SUM(price), 2) AS total_revenue,
    COUNT(DISTINCT customer_unique_id) AS num_customers
FROM 
    brazilian_ecommerce_cleaned
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_year, customer_state, payment_type
ORDER BY 
    total_revenue DESC;
