Week 2: SQL Analysis
Customer Analysis (Keerthi):
In Week 2, I performed customer analysis using SQL on the Superstore dataset.
- Calculated total sales using SUM function.
- Analyzed customer-wise sales using GROUP BY.
- Identified top customers based on total sales using ORDER BY.
- Analyzed sales across different regions to understand customer distribution.
SQL Queries Used:
1. Total Sales
SELECT SUM(Sales) AS total_sales
FROM superstore;
2. Customer-wise Sales
SELECT Customer_Name, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Customer_Name;
3. Top Customers
SELECT Customer_Name, SUM(Sales) AS total_sales
FROM superstore
GROUP BY Customer_Name
ORDER BY total_sales DESC;
Conclusion:
In this week, I used SQL queries to analyze customer data and identify top customers and sales patterns. This helped in understanding customer behavior and business performance.
