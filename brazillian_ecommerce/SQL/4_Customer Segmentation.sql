-- 👉 Helps show customer loyalty.

SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time Buyer'
        ELSE 'Repeat Buyer'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT customer_unique_id, COUNT(DISTINCT order_id) AS order_count
    FROM brazilian_ecommerce_cleaned
    GROUP BY customer_unique_id
) sub
GROUP BY customer_type;
