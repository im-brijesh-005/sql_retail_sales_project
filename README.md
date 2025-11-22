# 🛒 Retail Sales Analysis (PostgreSQL + Power BI)

This project demonstrates a fully integrated retail analytics workflow where **PostgreSQL and Power BI are directly connected in live sync**.  
Any modification in the PostgreSQL database—such as data cleaning, transformations, or recalculations—**automatically updates the Power BI dashboard**, eliminating manual refresh and ensuring accurate real-time reporting.

The repository includes:

- ✔ Raw retail dataset  
- ✔ SQL scripts for cleaning, transformation, and analysis  
- ✔ Power BI dashboard connected live to PostgreSQL  

---

## 📌 Project Overview

The goal of this project is to analyze real retail transaction data and uncover insights related to:

- Customer purchasing patterns  
- Category-wise performance  
- Hourly and seasonal demand behavior  
- Profitability and cost structure  
- Age- and gender-based sales contribution  

All processing and feature engineering were performed directly in **PostgreSQL**, and results were visualized using an interactive **Power BI dashboard** synchronized live with the database.

---

## 🧠 Data Preparation & Feature Engineering (PostgreSQL)

### 🔹 Data Cleaning  
- Removed incomplete or invalid records  
- Corrected column naming issues  
- Converted data types (e.g., `age` → integer)

### 🔹 New Features Created

| Feature | Description |
|--------|-------------|
| `month`, `year`, `day` | Extracted from sale date |
| `sale_hour` | Extracted from sale time |
| `sale_shift` | Morning, Afternoon, Evening, Night |
| `season` | Spring, Summer, Autumn, Winter |
| `profit_per_unit` | `price_per_unit - cogs` |
| `total_profit` | `profit_per_unit * quantity` |
| `age_group` | Child, Teen, Young, Adult, Senior Citizen |

### 🔹 SQL Concepts Applied

- Window functions (`LAG`)  
- Grouped aggregations  
- Nested subqueries  
- Conditional logic (`CASE`)  
- Trend and comparison analysis  

---

## 📊 Power BI Dashboard

### ⭐ Live Data Visualization

The dashboard connects directly to PostgreSQL and displays:

- Total Sales  
- Quantity Sold  
- Average Sales  
- Total Profit & COGS  
- Profit per Unit  

### 📈 Visual Insights

- Category-wise sales contribution  
- Gender-based breakdown  
- Hourly purchase behavior  
- Seasonal impact on sales and profits  
- Age group purchase distribution  
- Monthly & yearly performance trends  
- YoY gap analysis through SQL window functions  

---

## 🧰 Tech Stack

| Component      | Technology     |
|----------------|----------------|
| Database       | PostgreSQL     |
| Query Language | SQL            |
| Visualization  | Power BI       |
| Data Source    | Raw CSV dataset |

---

## 📁 Repository Structure

- `/sql/` – All PostgreSQL scripts used  
- `/dataset/` – Original raw retail dataset  
- `/dashboard/` – Power BI report connected live to PostgreSQL  

---

## 📎 Author

**Brijesh**  
Developed with SQL & Power BI for analytical insights.

This project uses a direct live connection between PostgreSQL and Power BI, ensuring that any transformation or update in the database is immediately reflected in the dashboard without manual refresh, improving efficiency and real-time reporting accuracy.
