-- 👉 Tells you which payment types bring in the most revenue.

SELECT 
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value),2) AS total_payment
FROM brazilian_ecommerce_cleaned
GROUP BY payment_type
ORDER BY total_payment DESC;



-- 👉 Perfect for a stacked line/bar chart in Excel:

-- X-axis = Month

-- Y-axis = Sales

-- Color = Payment Method

SELECT 
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
    payment_type,
    ROUND(SUM(payment_value),2) AS total_payment,
    COUNT(DISTINCT order_id) AS total_orders
FROM brazilian_ecommerce_cleaned
GROUP BY month, payment_type
ORDER BY month, total_payment DESC;


-- 👉 Sales by Payment Method (with Year, State, Payment Method for slicers)

SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,   -- slicer 1
    geolocation_state_customer AS customer_state,                -- slicer 2
    payment_type,                                                -- slicer 3 (also chart color)
    EXTRACT(MONTH FROM order_purchase_timestamp) AS month_num,
    TO_CHAR(order_purchase_timestamp, 'Month') AS month_name,
    ROUND(SUM(payment_value), 2) AS total_payment,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    brazilian_ecommerce_cleaned
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_year, customer_state, payment_type, month_num, month_name
ORDER BY 
    order_year, month_num, total_payment DESC;
