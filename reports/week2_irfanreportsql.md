Week 2: SQL Analysis

Profit Analysis (Irfan):

In Week 2, I performed profit analysis using SQL on the Superstore dataset to extract meaningful business insights.

- Calculated total profit using the `SUM` function to understand overall profitability.
- Analyzed profit by Category using `GROUP BY` to identify top-performing categories.
- Sorted results using `ORDER BY` to highlight highest profit-generating segments.
- Analyzed profit across different Regions to identify high-performing areas.
- Drilled down into Sub-Category and Product level for deeper insights.

SQL Queries, I Used

1. Total Profit

```sql
SELECT SUM(Profit) AS total_profit
FROM profit_data;
```

2. Profit by Category

```sql
SELECT Category, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Category
ORDER BY total_profit DESC;
```

3. Profit by Region

```sql
SELECT Region, SUM(Profit) AS total_profit
FROM profit_data
GROUP BY Region
ORDER BY total_profit DESC;
```

4. Profit by Sub-Category

```sql
SELECT "Sub-Category", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;
```

5. Top 5 Most Profitable Products

```sql
SELECT "Product Name", SUM(Profit) AS total_profit
FROM profit_data
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 5;
```
Conclusion:

In this week, I used SQL queries to analyze profit data and extract insights such as total profit, top categories, regional performance, and most profitable products. This helped in better understanding of business performance and decision-making.
