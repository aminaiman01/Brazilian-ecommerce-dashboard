-- Deduplicate raw table
CREATE TABLE brazilian_ecommerce_dedup AS
SELECT DISTINCT * 
FROM brazilian_ecommerce;


-- Create cleaned table based on deduped version
CREATE TABLE brazilian_ecommerce_cleaned AS
SELECT *
FROM brazilian_ecommerce_dedup
WHERE 
    -- delivery date must be after purchase
    (order_delivered_customer_date IS NULL OR order_delivered_customer_date >= order_purchase_timestamp)
    -- estimated delivery must be after purchase
    AND (order_estimated_delivery_date IS NULL OR order_estimated_delivery_date >= order_purchase_timestamp);


DELETE FROM brazilian_ecommerce_cleaned
WHERE price <= 0 OR payment_value <= 0 OR freight_value < 0;

SELECT DISTINCT order_status FROM brazilian_ecommerce_cleaned;
SELECT DISTINCT payment_type FROM brazilian_ecommerce_cleaned;

UPDATE brazilian_ecommerce_cleaned
SET payment_type = TRIM(LOWER(payment_type));


-- Row count after cleaning
SELECT COUNT(*) FROM brazilian_ecommerce_cleaned;

-- Sample preview
SELECT * FROM brazilian_ecommerce_cleaned LIMIT 10;
