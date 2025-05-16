CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

CREATE TABLE IF NOT EXISTS sales_data (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
);


LOAD DATA LOCAL INFILE 'C:/Users/Vinit/Desktop/Retail-Business-Performance-Analysis/cleaned_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(row_id, order_id, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, postal_code, region, product_id, category, sub_category, product_name, sales, profit);


SELECT * FROM sales_data LIMIT 10;

SELECT COUNT(*) AS total_rows FROM sales_data;

SELECT 
  SUM(postal_code IS NULL) AS null_postal_code
FROM sales_data;

SELECT 
  ROUND(SUM(sales), 2) AS total_sales, 
  ROUND(SUM(profit), 2) AS total_profit
FROM sales_data;

SELECT category, 
       ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC
LIMIT 5;

SELECT region, 
       ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_profit DESC;

SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS order_month,
  ROUND(SUM(profit), 2) AS monthly_profit
FROM sales_data
GROUP BY order_month
ORDER BY order_month;

SELECT sub_category, 
       ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 5;

