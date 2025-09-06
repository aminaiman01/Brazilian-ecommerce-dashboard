-- 👉 Great for a line chart in Excel.

SELECT
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
    ROUND(SUM(price),2) AS total_revenue,
    COUNT(DISTINCT order_id) AS num_orders
FROM brazilian_ecommerce_cleaned
GROUP BY month
ORDER BY month;


-- 👉 Monthly Sales Trend (with Year, State, Payment Method for slicers)

SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,   -- slicer 1
    geolocation_state_customer AS customer_state,                -- slicer 2
    payment_type,                                                -- slicer 3
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month_num,
    TO_CHAR(order_purchase_timestamp, 'Month') AS month_name,
    ROUND(SUM(price), 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS num_orders
FROM 
    brazilian_ecommerce_cleaned
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_year, customer_state, payment_type, month_num, month_name
ORDER BY 
    order_year, month_num;
