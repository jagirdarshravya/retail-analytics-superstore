-- ============================================
-- CUSTOMER ANALYSIS - SUPERSTORE DATASET
-- ============================================

-- --------------------------------------------
-- Total Sales
-- This query calculates total revenue
-- --------------------------------------------
SELECT SUM(Sales) AS total_sales
FROM superstore;

-- --------------------------------------------
-- Top Customers
-- This query identifies top customers by sales
-- --------------------------------------------
SELECT Customer_Name, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Customer_Name
ORDER BY total_sales DESC;

-- --------------------------------------------
-- Total Profit
-- This query calculates total profit
-- --------------------------------------------
SELECT SUM(Profit) AS total_profit
FROM superstore;
