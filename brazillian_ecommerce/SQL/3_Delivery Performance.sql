-- 👉 Shows logistics efficiency.

SELECT 
    COUNT(*) FILTER (WHERE order_delivered_customer_date <= order_estimated_delivery_date) AS on_time,
    COUNT(*) FILTER (WHERE order_delivered_customer_date > order_estimated_delivery_date) AS late,
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL) AS not_delivered
FROM brazilian_ecommerce_cleaned;
