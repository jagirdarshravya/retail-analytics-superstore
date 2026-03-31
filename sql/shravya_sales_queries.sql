-- Query 1: Calculate Total Sales (Total Revenue)
SELECT SUM(Sales) AS Total_Sales
FROM "Sample - Superstore";

-- Query 2: Product-wise Sales (Top Selling Products)
SELECT "Product Name", SUM(Sales) AS Total_Sales
FROM "Sample - Superstore"
GROUP BY "Product Name"
ORDER BY Total_Sales DESC;

-- Query 3: Category-wise Sales Analysis
SELECT Category, SUM(Sales) AS Total_Sales
FROM "Sample - Superstore"
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Query 4: Region-wise Sales Analysis
SELECT Region, SUM(Sales) AS Total_Sales
FROM "Sample - Superstore"
GROUP BY Region
ORDER BY Total_Sales DESC;
