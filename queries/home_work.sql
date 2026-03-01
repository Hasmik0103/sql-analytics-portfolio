SELECT
  DATE_TRUNC('month', order_date_date) AS month,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('month',order_date_date)
ORDER BY month;
SELECT
   DATE_TRUNC('quarter', order_date_date) AS quarter,
   SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('quarter',order_date_date)
ORDER BY quarter; 
SELECT
   DATE_TRUNC('year', order_date_date) AS year,
   SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('year', order_date_date)
ORDER BY year;
SELECT
  DATE_TRUNC('month', order_date_date) AS month,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('month', order_date_date)
ORDER BY SUM(total_sales) DESC
LIMIT 5;
SELECT
   DATE_TRUNC('month',order_date_date) AS month,
   SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('month', order_date_date)
ORDER BY SUM(total_sales) ASC
LIMIT 5;
__
SELECT
  customer_name,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY customer_name
ORDER BY SUM(total_sales) DESC
LIMIT 10;
SELECT
  customer_name,
  order_date_date,
  DATE_TRUNC('month',order_date_date) order_months
FROM public.sales_analysis
WHERE customer_name='Micheal Smith'
__
SELECT
  order_date_date,
  AGE(CURRENT_DATE, order_date_date) AS order_age
FROM sales_analysis
LIMIT 10;
  


