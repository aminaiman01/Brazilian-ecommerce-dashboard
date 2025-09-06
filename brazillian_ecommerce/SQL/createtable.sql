DROP TABLE IF EXISTS brazilian_ecommerce;

CREATE TABLE brazilian_ecommerce (
    order_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    geolocation_city_customer VARCHAR(100),
    geolocation_state_customer VARCHAR(10),
    product_id VARCHAR(50),
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),
    shipping_limit_date TIMESTAMP,
    product_category_name_english VARCHAR(100),
    payment_type VARCHAR(20),
    payment_value NUMERIC(10,2),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    geolocation_lat_customer FLOAT,
    geolocation_lng_customer FLOAT,
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    geolocation_lat_seller FLOAT,
    geolocation_lng_seller FLOAT
);
