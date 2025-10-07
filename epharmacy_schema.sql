CREATE DATABASE IF NOT EXISTS epharmacy;
USE epharmacy;

CREATE TABLE customers (
  customer_id VARCHAR(12) PRIMARY KEY,
  signup_date DATE,
  city VARCHAR(100),
  state VARCHAR(100),
  has_chronic_condition TINYINT(1),
  age_group ENUM('18-25','26-40','41-60','60+'),
  first_touch_channel VARCHAR(100)
);

CREATE TABLE products (
  product_id VARCHAR(12) PRIMARY KEY,
  product_name VARCHAR(255),
  product_category VARCHAR(100),
  is_prescription_required TINYINT(1),
  price_per_unit DECIMAL(10,2)
);

CREATE TABLE orders (
  order_id VARCHAR(12) PRIMARY KEY,
  customer_id VARCHAR(12),
  product_id VARCHAR(12),
  quantity INT,
  order_date DATETIME,
  promo_code_used VARCHAR(50),
  revenue DECIMAL(12,2),
  INDEX idx_customer (customer_id),
  INDEX idx_order_date (order_date),
  INDEX idx_promo (promo_code_used),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE digital_marketing (
  campaign_date DATE,
  channel VARCHAR(100),
  clicks INT,
  impressions INT,
  cost DECIMAL(12,2),
  associated_promo_code VARCHAR(50)
);
