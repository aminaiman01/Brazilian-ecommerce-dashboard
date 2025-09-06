-- 👉 Tells you the best-performing categories.


SELECT 
    product_category_name_english AS category,
    ROUND(SUM(price),2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM brazilian_ecommerce_cleaned
GROUP BY category
ORDER BY total_revenue DESC




-- 👉 Best-performing product categories (with Year, State, Payment Method for slicers)

SELECT 
    EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,  -- slicer 1
    geolocation_state_customer AS customer_state,               -- slicer 2
    payment_type,                                               -- slicer 3
    product_category_name_english AS category,
    ROUND(SUM(price), 2) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    brazilian_ecommerce_cleaned
WHERE 
    order_status = 'delivered'
GROUP BY 
    order_year, customer_state, payment_type, category
ORDER BY 
    total_revenue DESC;
