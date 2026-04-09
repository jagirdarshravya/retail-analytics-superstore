CREATE DATABASE superstore_Sales;
USE superstore_Sales;
-- =====================================================
-- REGIONAL ANALYSIS - SUPERSTORE SALES DATASET
-- =====================================================

-- -----------------------------------------------------
-- Total Orders
-- This query calculates the total number of orders
-- -----------------------------------------------------
SELECT COUNT(*) AS total_orders
FROM superstore_clean;


-- -----------------------------------------------------
-- Total Sales
-- This query calculates total revenue generated
-- -----------------------------------------------------
SELECT SUM(sales) AS total_sales
FROM superstore_clean;

-- -----------------------------------------------------
-- Total Profit
-- This query calculates total profit
-- -----------------------------------------------------
SELECT SUM(profit) AS total_profit
FROM superstore_clean;

-- =====================================================
-- REGIONAL LEVEL ANALYSIS
-- =====================================================

-- -----------------------------------------------------
-- Sales by Region
-- Shows total sales for each region
-- -----------------------------------------------------
SELECT region,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region
ORDER BY total_sales DESC;

-- -----------------------------------------------------
-- Profit by Region
-- Shows total profit for each region
-- -----------------------------------------------------
SELECT region,SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY region
ORDER BY total_profit DESC;

-- -----------------------------------------------------
-- Orders by Region
-- Counts number of orders in each region
-- -----------------------------------------------------
SELECT region,COUNT('order id') AS total_orders
FROM superstore_clean
GROUP BY region
ORDER BY total_orders DESC;

-- -----------------------------------------------------
-- Sales & Profit by Region (Combined View)
-- Helps compare revenue and profitability
-- -----------------------------------------------------
SELECT region,SUM(sales) AS total_sales,SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY region
ORDER BY total_sales DESC;


-- =====================================================
-- STATE LEVEL ANALYSIS
-- =====================================================
-- -----------------------------------------------------
-- Sales by State
-- Shows which states generate highest sales
-- -----------------------------------------------------
SELECT state,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY state
ORDER BY total_sales DESC;

-- -----------------------------------------------------
-- Profit by State
-- Shows profitability by state
-- -----------------------------------------------------
SELECT state,SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY state
ORDER BY total_profit DESC;

-- -----------------------------------------------------
-- Top 5 States by Sales
-- Identifies top performing states
-- -----------------------------------------------------
SELECT state,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY state
ORDER BY total_sales DESC
LIMIT 5;


-- =====================================================
-- CITY LEVEL ANALYSIS
-- =====================================================

-- -----------------------------------------------------
-- Top 10 Cities by Sales
-- Shows cities with highest sales
-- -----------------------------------------------------
SELECT city,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================
-- IMPORTANT INSIGHT
-- =====================================================

-- -----------------------------------------------------
-- Loss-Making Regions
-- Identifies regions where profit is negative
-- -----------------------------------------------------
SELECT region,SUM(profit) AS total_profit
FROM superstore_clean
GROUP BY region
HAVING total_profit < 0;
-- -----------------------------------------------------
-- Profit Margin by Region
-- Shows how profitable each region is
-- -----------------------------------------------------
SELECT region,SUM(profit) / SUM(sales) AS profit_margin
FROM superstore_clean
GROUP BY region
ORDER BY profit_margin DESC;
-- -----------------------------------------------------
-- Top States within Each Region
-- -----------------------------------------------------
SELECT region,state,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region, state
ORDER BY region, total_sales DESC;

-- -----------------------------------------------------
-- Top Cities within Each Region
-- -----------------------------------------------------
SELECT region,city,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region, city
ORDER BY region, total_sales DESC;

-- -----------------------------------------------------
-- Category Performance by Region
-- -----------------------------------------------------
SELECT region,category,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region, category
ORDER BY region, total_sales DESC;

-- -----------------------------------------------------
-- Best Category in Each Region
-- -----------------------------------------------------
SELECT region,category,SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region, category
HAVING total_sales = (
    SELECT MAX(region_sales)
    FROM (
        SELECT region AS r,category,SUM(sales) AS region_sales
        FROM superstore_clean
        GROUP BY region, category
    ) t
    WHERE t.r = superstore_clean.region
);

-- -----------------------------------------------------
-- Monthly Sales Trend by Region
-- -----------------------------------------------------
ALTER TABLE superstore_clean
ADD order_date_new DATE;

UPDATE superstore_clean
SET order_date_new = STR_TO_DATE(`Order Date`, '%Y-%m-%d');

SELECT region,
       YEAR(order_date_new) AS year,
       MONTH(order_date_new) AS month,
       SUM(sales) AS total_sales
FROM superstore_clean
GROUP BY region, year, month
ORDER BY region, year, month;

-- -----------------------------------------------------
-- Average Shipping Time by Region
-- -----------------------------------------------------
ALTER TABLE superstore_clean
ADD ship_date_new DATE;

UPDATE superstore_clean
SET ship_date_new = STR_TO_DATE(`Ship Date`, '%Y-%m-%d');
SELECT region,
       AVG(DATEDIFF(ship_date_new,order_date_new)) AS avg_shipping_days
FROM superstore_clean
GROUP BY region;