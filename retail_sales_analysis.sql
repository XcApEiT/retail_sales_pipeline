USE retail;
GO

-- Overall KPIs
SELECT COUNT(*) AS total_transactions,
       COUNT(DISTINCT customer_id) AS total_customers,
       SUM(quantity) AS total_units_sold,
       SUM(total_amount) AS total_revenue,
       AVG(total_amount) AS average_order_value
FROM dbo.retail_sales;

-- Revenue by category
SELECT product_category,
       SUM(total_amount) AS revenue,
       SUM(quantity) AS units_sold
FROM dbo.retail_sales
GROUP BY product_category
ORDER BY revenue DESC;

-- Monthly revenue
SELECT month, month_name, SUM(total_amount) AS revenue
FROM dbo.retail_sales
GROUP BY month, month_name
ORDER BY month;

-- Top 10 customers
SELECT TOP 10 customer_id, SUM(total_amount) AS total_spent
FROM dbo.retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC;

-- Weekend vs weekday
SELECT CASE WHEN is_weekend = 1 THEN 'Weekend' ELSE 'Weekday' END AS sales_period,
       COUNT(*) AS transactions,
       SUM(total_amount) AS revenue,
       AVG(total_amount) AS average_transaction
FROM dbo.retail_sales
GROUP BY is_weekend
ORDER BY revenue DESC;

-- Customer segmentation
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM dbo.retail_sales
    GROUP BY customer_id
)
SELECT CASE
           WHEN total_spent >= 1000 THEN 'High Value'
           WHEN total_spent >= 500 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment,
       COUNT(*) AS customers,
       SUM(total_spent) AS revenue
FROM customer_spending
GROUP BY CASE
             WHEN total_spent >= 1000 THEN 'High Value'
             WHEN total_spent >= 500 THEN 'Medium Value'
             ELSE 'Low Value'
         END
ORDER BY revenue DESC;

-- Customer ranking
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM dbo.retail_sales
    GROUP BY customer_id
)
SELECT customer_id, total_spent,
       RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM customer_spending
ORDER BY spending_rank;

-- Cumulative monthly revenue
WITH monthly_sales AS (
    SELECT month, month_name, SUM(total_amount) AS revenue
    FROM dbo.retail_sales
    GROUP BY month, month_name
)
SELECT month, month_name, revenue,
       SUM(revenue) OVER (ORDER BY month) AS cumulative_revenue
FROM monthly_sales
ORDER BY month;

-- Data-quality checks
SELECT transaction_id, COUNT(*) AS record_count
FROM dbo.retail_sales
GROUP BY transaction_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS missing_customer_ids
FROM dbo.retail_sales
WHERE customer_id IS NULL;

SELECT COUNT(*) AS invalid_quantities
FROM dbo.retail_sales
WHERE quantity <= 0;

SELECT COUNT(*) AS invalid_prices
FROM dbo.retail_sales
WHERE price_per_unit <= 0;

SELECT COUNT(*) AS incorrect_amounts
FROM dbo.retail_sales
WHERE total_amount <> quantity * price_per_unit;
