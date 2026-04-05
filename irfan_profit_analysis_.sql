Week 2: Profit Analysis using SQL
-- Table: profit_data
-- =========================================

--  1. Total Profit
-- Result: ~286,397
SELECT SUM(Profit) AS total_profit
FROM profit_data;


--  2. Profit by Category
-- Result:
-- Technology       ~145,454
-- Office Supplies  ~122,490
-- Furniture        ~18,451
SELECT Category, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Category
ORDER BY total_profit DESC;


--  3. Profit by Region
-- Result: Profit varies across regions; top-performing region has highest contribution.
SELECT Region, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Region
ORDER BY total_profit DESC;


--  4. Profit by Sub-Category
-- Result: Identifies most and least profitable sub-categories within each category.
SELECT "Sub-Category", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;


--  5. Top 5 Most Profitable Products
-- Result: Displays top 5 products contributing highest profit (e.g., Canon Copier etc.)
SELECT "Product Name", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 5;

-- =========================================
-- End of Profit Analysis Queries
-- =========================================
