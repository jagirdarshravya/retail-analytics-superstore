-----------------------------------------------
Week 2: Sql Queries - Profit Analysis using SQL
-- Table: profit_data
------------------------------------------------

--  1. Total Profit
SELECT SUM(Profit) AS total_profit
FROM profit_data;


--  2. Profit by Category
SELECT Category, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Category
ORDER BY total_profit DESC;


--  3. Profit by Region
SELECT Region, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Region
ORDER BY total_profit DESC;


--  4. Profit by Sub-Category
SELECT "Sub-Category", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;


--  5. Top 5 Most Profitable Products
SELECT "Product Name", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 5;


