# Retail Sales ETL & Analytics Pipeline

A beginner-to-intermediate data engineering project using Python/Pandas and SQL Server.

## Architecture
Raw CSV → Python/Pandas → Profiling → Cleaning & Validation → Transformation → Cleaned CSV → PyODBC → SQL Server → SQL Analytics

## Technologies
Python, Pandas, Jupyter Notebook, PyODBC, SQL Server, SSMS.

## Python ETL
- Extract retail transactions from CSV
- Profile structure and data quality
- Validate nulls, duplicates, age, quantity, price, and transaction amounts
- Convert dates
- Create year/month/day features
- Create age groups
- Create weekend flag
- Export processed data
- Load into SQL Server

## SQL
- KPI analysis
- Category and monthly revenue
- Top customers
- Weekend vs weekday
- CTE + CASE customer segmentation
- RANK window function
- Cumulative revenue
- Post-load quality checks

## Key Results
- 1,000 transactions
- 1,000 customers
- 2,514 units sold
- 456,000 total revenue
- 456 average transaction value
- Electronics: highest category revenue (156,905)
- May: highest monthly revenue (53,150)
- September: lowest monthly revenue (23,620)
- High-value segment: 202 customers, 286,800 revenue

## Files
- 01_retail_sales_etl.ipynb
- retail_sales_analysis.sql
- retail_sales_cleaned.csv
