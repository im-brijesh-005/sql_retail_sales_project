# 🛒 Retail Sales Analysis (PostgreSQL + Power BI)

This project showcases a complete end-to-end retail analytics workflow using **PostgreSQL for data engineering** and **Power BI for business intelligence reporting**.  

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
- Profitability and cost distribution  
- Age- and gender-based sales contribution  

All data processing and feature engineering were performed directly in **PostgreSQL**, and results were visualized using an interactive **Power BI dashboard** synced with the database.

---

## 🧠 Data Preparation & Feature Engineering (PostgreSQL)

### 🔹 Data Cleaning  
- Removed records with missing or invalid fields  
- Renamed incorrectly defined columns  
- Converted formats (e.g., `age` → integer)

### 🔹 New Columns Created Through SQL

| Feature | Description |
|--------|-------------|
| `month`, `year`, `day` | Extracted from sale date |
| `sale_hour` | Extracted from sale time |
| `sale_shift` | Categorized as Morning, Afternoon, Evening, Night |
| `season` | Segmented into Spring, Summer, Autumn, Winter |
| `profit_per_unit` | `price_per_unit - cogs` |
| `total_profit` | `profit_per_unit * quantity` |
| `age_group` | Child, Teen, Young, Adult, Senior Citizen |

### 🔹 Advanced SQL Concepts Used

- Window Functions (`LAG`)  
- Aggregate summarization  
- Nested subqueries  
- Conditional logic (`CASE`)  
- Group comparisons  

---

## 📊 Power BI Dashboard

The dashboard connects **directly to PostgreSQL** and visualizes:

### ⭐ Key Metrics

- Total Sales  
- Total Quantity Sold  
- Average Sales  
- Total Profit & COGS  
- Profit per Unit  

### 📈 Dashboard Visuals

- Category-wise sales share  
- Gender-based profit and sales  
- Hourly purchase trend  
- Seasonal sales vs. profit  
- Age group purchase comparison  
- Monthly & yearly sales trend  
- YoY performance using SQL window functions  

---

## 🧰 Tech Stack

| Component      | Technology     |
|----------------|----------------|
| Database       | PostgreSQL     |
| Query Language | SQL            |
| Visualization  | Power BI       |
| Data Source    | Raw CSV dataset |

---

## 📁 Files Included

- `/sql/` – All SQL scripts used  
- `/dataset/` – Raw retail sales data  
- `/dashboard/` – Power BI report  

---

## 📎 Author

**Brijesh**  
Developed with SQL & Power BI for analytical insights.

