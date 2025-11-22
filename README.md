# sql_retail_sales_project
🛒 Retail Sales Analysis (PostgreSQL + Power BI)

This project demonstrates a complete end-to-end retail sales analysis pipeline using PostgreSQL for data processing and Power BI for interactive data visualization.
The repository includes:

✔ Original raw retail dataset

✔ PostgreSQL SQL scripts for cleaning, transformation & analysis

✔ Power BI dashboard connected directly to PostgreSQL

📌 Project Overview

The goal of this project is to analyze transactional retail data to uncover business insights related to:

Customer purchasing patterns

Category performance

Seasonal and hourly sales behavior

Profitability and cost structure

Age-based and gender-based purchase trends

All processing, data cleaning, transformation, and feature engineering were done directly in PostgreSQL, and the results were visualized in Power BI by establishing a live connection with the database.

🧠 Data Preparation & Feature Engineering

Key operations performed in SQL:

🔹 Data Cleaning

Removed records with missing or invalid fields

Corrected column names

Converted column types (e.g., age → integer)

🔹 New Derived Columns

Using SQL, the following fields were generated:

month, year, day

sale_hour

sale_shift
(Morning, Afternoon, Evening, Night)

season
(Spring, Summer, Autumn, Winter)

profit_per_unit, total_profit

age_group
(Child, Teen, Young, Adult, Senior Citizen)

🔹 Advanced SQL Usage

Window functions (LAG)

Aggregate analytics (SUM, COUNT, AVG)

Subqueries and grouped comparisons

CASE expressions

📊 Power BI Dashboard

The Power BI dashboard reads live data directly from PostgreSQL and visualizes:

⭐ Key KPIs

Total Sales

Quantity Sold

Average Sales

Profit & COGS

Profit per Unit

📈 Insights Shown in Charts

Category-wise sales and share

Gender-based contribution

Hourly purchase volume

Season-wise profit and sales

Age group purchasing behavior

Monthly and yearly sales comparison

YoY (Year-over-Year) gaps using SQL window functions


| Component      | Technology                     |
| -------------- | ------------------------------ |
| Database       | PostgreSQL                     |
| Query Language | SQL                            |
| Visualization  | Power BI                       |
| Data Storage   | Raw CSV uploaded in repository |
