-- Total Sales
SELECT SUM(Sales) FROM superstore;

-- Top Customers
SELECT Customer_Name, SUM(Sales)
FROM superstore
GROUP BY Customer_Name
ORDER BY SUM(Sales) DESC;

-- Total Profit
SELECT SUM(Profit) FROM superstore;
