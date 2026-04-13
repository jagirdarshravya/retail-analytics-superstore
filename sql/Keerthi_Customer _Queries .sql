-- =========================================
-- WEEK 2: DATA CLEANING + BASIC ANALYSIS
-- =========================================

-- View Data
SELECT * FROM superstore;

-- -----------------------------------------

-- Check NULL Values
SELECT *
FROM superstore
WHERE Sales IS NULL
   OR Profit IS NULL
   OR Quantity IS NULL;

-- -----------------------------------------

-- Count Total Records
SELECT COUNT(*) AS total_rows
FROM superstore;

-- -----------------------------------------

-- Total Sales
SELECT SUM(Sales) AS total_sales
FROM superstore;

-- Total Profit
SELECT SUM(Profit) AS total_profit
FROM superstore;

-- -----------------------------------------

-- Distinct Categories
SELECT DISTINCT Category FROM superstore;
SELECT DISTINCT Region FROM superstore;
SELECT DISTINCT Segment FROM superstore;

-- -----------------------------------------

-- Sales by Region
SELECT Region, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;

-- -----------------------------------------

-- Profit by Category
SELECT Category, SUM(Profit) AS total_profit
FROM superstore
GROUP BY Category
ORDER BY total_profit DESC;

-- -----------------------------------------

-- Loss Records
SELECT *
FROM superstore
WHERE Profit < 0;

-- -----------------------------------------

-- Top 5 Sales
SELECT *
FROM superstore
ORDER BY Sales DESC
LIMIT 5;

-- =========================================
-- END OF WEEK 2
-- =========================================
