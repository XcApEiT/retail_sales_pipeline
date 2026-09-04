# Retail Sales ETL & SQL Analytics Pipeline

## Goal
Build a small, interview-ready data engineering pipeline using a real retail transaction dataset.

## Flow
Kaggle CSV -> Python/Pandas cleaning -> validation -> transformed CSV -> SQL database -> analytical SQL

## Dataset
Retail Sales Dataset by Terence Katua, available on Kaggle.

Source:
https://www.kaggle.com/datasets/terencekatua/retail-sales-dataset

The repository also has a public mirror of the dataset for inspection.

## Python transformations
- Standardize column names
- Parse dates
- Convert numeric fields
- Remove duplicate transaction IDs
- Remove records with required missing fields
- Reject invalid ages, quantities and prices
- Recalculate sales amount from quantity * price
- Create year/month/month name
- Create weekday and weekend flag
- Create customer age groups

## Data-quality checks
- Unique transaction IDs
- Required fields are populated
- Positive quantity and price
- Recalculated sales amount is internally consistent

## SQL layer
The cleaned data is loaded into `retail_sales`. The SQL script calculates:
- Revenue
- Units sold
- Average order value
- Revenue by category
- Monthly revenue
- Top customers
- Weekday vs weekend performance

## Project scope
This is intentionally a small batch ETL project. It demonstrates core data engineering concepts without adding unnecessary cloud, Spark, Kafka or ML complexity.
