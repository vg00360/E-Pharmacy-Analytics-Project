USE epharmacy;

DROP TABLE IF EXISTS customer_features;
CREATE TABLE customer_features AS
SELECT 
    c.customer_id,
    c.signup_date,
    c.city,
    c.state,
    c.has_chronic_condition,
    c.age_group,
    c.first_touch_channel,
    MAX(o.order_date) AS last_order_date,
    MIN(o.order_date) AS first_order_date,
    COUNT(o.order_id) AS frequency,
    SUM(o.quantity * p.price_per_unit) AS monetary,
    AVG(o.quantity * p.price_per_unit) AS avg_order_value,
    CASE WHEN COUNT(o.order_id) > 1 THEN
        DATEDIFF(MAX(o.order_date), MIN(o.order_date)) / (COUNT(o.order_id)-1)
    ELSE NULL END AS avg_days_between_orders,
    AVG(CASE WHEN o.promo_code_used IS NOT NULL THEN 1 ELSE 0 END) AS pct_promo_orders,
    AVG(p.is_prescription_required) AS prescription_rate,
    DATEDIFF(CURDATE(), c.signup_date) AS tenure_days,
    DATEDIFF(CURDATE(), MAX(o.order_date)) AS recency_days,
    CASE WHEN MAX(o.order_date) IS NULL OR DATEDIFF(CURDATE(), MAX(o.order_date)) > 90 THEN 1 ELSE 0 END AS is_churned
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, c.signup_date, c.city, c.state, c.has_chronic_condition, c.age_group, c.first_touch_channel;
