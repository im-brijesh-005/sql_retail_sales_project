-- creating table
CREATE TABLE IF NOT EXISTS retail_sales (
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(20),
	age VARCHAR(50),
	category VARCHAR(50),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
);

ALTER TABLE retail_sales
RENAME quantiy TO quantity;

-- Previewing up the data
SELECT * FROM retail_sales;

-- Checking up whole of the data loaded or not
SELECT count(*) FROM retail_sales;

-- checking NULLs
SELECT * FROM retail_sales
WHERE sale_date IS NULL;

SELECT * FROM retail_sales
WHERE sale_time IS NULL;

SELECT * FROM retail_sales
WHERE customer_id IS NULL;

SELECT * FROM retail_sales
WHERE gender IS NULL;

SELECT * FROM retail_sales
WHERE age IS NULL;

SELECT * FROM retail_sales
WHERE category IS NULL;

SELECT * FROM retail_sales
WHERE quantity IS NULL;

SELECT * FROM retail_sales
WHERE price_per_unit IS NULL;

SELECT * FROM retail_sales
WHERE cogs IS NULL;

-- counting all nulls using
SELECT COUNT(*) FROM retail_sales
WHERE 
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR 
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR
	gender IS NULL
	OR 
	age IS NULL
	OR
	category IS NULL
	OR 
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR 
	cogs IS NULL;


-- deleting as the number of null is low 
DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR 
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR
	gender IS NULL
	OR 
	age IS NULL
	OR
	category IS NULL
	OR 
	quantity IS NULL
	OR 
	price_per_unit IS NULL
	OR 
	cogs IS NULL;


-- Left record we have
SELECT COUNT(*) FROM retail_sales

-- How many customers does we have?
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- How many categories does we have?
SELECT DISTINCT category FROM retail_sales;

-- Extracting month
ALTER TABLE retail_sales
ADD COLUMN month INT;

UPDATE retail_sales
SET month = EXTRACT(MONTH FROM sale_date);


-- Extracting year
ALTER TABLE retail_sales
ADD COLUMN year INT;

UPDATE retail_sales
SET year = EXTRACT(YEAR FROM sale_date);

-- EXTRACTING DAY 
ALTER TABLE retail_sales
ADD COLUMN DAY INT;

UPDATE retail_sales
SET day = EXTRACT(DAY FROM sale_date);

-- EXTRACT HOUR
ALTER TABLE retail_sales
ADD COLUMN sale_hour INT;

UPDATE retail_sales
SET sale_hour = EXTRACT(HOUR FROM sale_time)

-- Making shifts of purchase
ALTER TABLE retail_sales
ADD COLUMN sale_shift VARCHAR(50);

UPDATE retail_sales
SET sale_shift =
	CASE
		WHEN sale_hour>=6 AND sale_hour<12 THEN 'Morning'
		WHEN sale_hour>=12 AND sale_hour<16 THEN 'Afternoon'
		WHEN sale_hour>=16 AND sale_hour<18 THEN 'Evening'
		ELSE 'Night'
	END;

-- Category Wise sales
SELECT 
	category,
	SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- Yearly sales
SELECT 
	Year,
	category,
	SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY year, category
ORDER BY year;

-- category wise sales in each month and year
SELECT 
	category,
	year,
	month,
	SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category, year, month
ORDER BY category, year, month;

-- category avg sale
SELECT 
	category,
	AVG(total_sale) AS average_sale
FROM retail_sales
GROUP BY category;

-- Number of transaction in each category by gender
SELECT 
	gender,
	category,
	COUNT(transactions_id) AS no_of_trans
FROM retail_sales
GROUP BY gender, category
ORDER BY gender, no_of_trans;

-- AVG sales in months
SELECT 
	year,
	month,
	ROUND(AVG(total_sale:: numeric), 2) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY year, month;


-- finding number of customers who made purchase from all categories

SELECT 
	COUNT(*) AS total_customers
FROM(
SELECT 
	customer_id
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(DISTINCT category) = (
SELECT COUNT(DISTINCT category)
FROM retail_sales
)
);


-- avg sale in each purchasing shift

SELECT
	sale_shift,
	AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY sale_shift
ORDER BY avg_sale;

-- month wise avg sale in each purchasing shift
SELECT 
	month,
	sale_shift,
	avg(total_sale) AS avg_sale
FROM retail_sales
GROUP BY month, sale_shift
ORDER BY month, avg_sale;


-- Year sale gap of each month

SELECT 
	year,
	month,
	monthly_sale,
	LAG(monthly_sale) OVER (PARTITION BY month ORDER BY year) AS previous_year_month_sale,
	monthly_sale - LAG(monthly_sale) OVER (PARTITION BY month ORDER BY year) AS gap
FROM (
	SELECT 
		year,
		month,
		SUM(total_sale) AS monthly_sale
	FROM retail_sales
	GROUP BY year, month
) AS t
ORDER BY year, month;


-- Year sale gap of each month by categories

SELECT
	category,
	year,
	month,
	LAG(monthly_sale) OVER (PARTITION BY category,month ORDER BY year) AS previous_year_month_sale,
	monthly_sale - LAG(monthly_sale) OVER (PARTITION BY category, month ORDER BY year) AS gap
FROM (
	SELECT
		category,
		year, 
		month,
		SUM(total_sale) AS monthly_sale
	FROM retail_sales
	GROUP BY category,year, month
) AS t
ORDER BY category,year, month;

-- Making seasons for sales

ALTER TABLE retail_sales
ADD COLUMN season VARCHAR(50);

UPDATE retail_sales
SET season =
	CASE 
		WHEN month > 2 AND month<=5 THEN 'Spring'
		WHEN month>5 AND month <= 8 THEN 'Summer'
		WHEN month>8 AND month <= 11 THEN 'Autumn'
		ELSE 'Winter'
	END;

SELECT * FROM retail_sales;


-- Profit per unit
ALTER TABLE retail_sales
ADD COLUMN profit_per_unit FLOAT;

UPDATE retail_sales
SET profit_per_unit = price_per_unit - cogs;

-- TOTAL PROFIT
ALTER TABLE retail_sales
ADD COLUMN total_profit FLOAT;

UPDATE retail_sales
SET total_profit = profit_per_unit*quantity;

--Making age column as integer
ALTER TABLE retail_sales
ALTER COLUMN age TYPE INT USING age::INT;
-- Grouping gender
ALTER TABLE retail_sales
ADD COLUMN age_group VARCHAR(50);

UPDATE retail_sales
SET age_group =
	CASE
		WHEN age >=1 AND age < 13 THEN 'Child'
		WHEN age>=13 AND age < 20 THEN 'Teen'
		WHEN age>=20 AND age < 36 THEN 'Young'
		WHEN age>=36 AND age < 61 THEN 'Adult'
		ELSE 'Senior Citizen'
	END;

SELECT * FROM retail_sales;