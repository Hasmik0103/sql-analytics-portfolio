SELECT
  DATE_TRUNC('month', order_date_date) AS month,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('month', order_date_date)
ORDER BY month;
SELECT
  DATE_TRUNC('quarter', order_date_date) AS quarter,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('quarter', order_date_date)
ORDER BY quarter;
SELECT
  DATE_TRUNC('month', order_date_date) AS month,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('month', order_date_date)
ORDER BY SUM(total_sales) DESC
LIMIT 3;
SELECT
  DATE_TRUNC('quarter', order_date_date) AS quarter,
  SUM(total_sales) AS total_revenue
FROM sales_analysis
GROUP BY DATE_TRUNC('quarter', order_date_date)
ORDER BY SUM(total_sales) DESC;
SELECT
  order_date_date,
  CURRENT_DATE - order_date_date AS days_since_order
FROM sales_analysis;
SELECT
   COUNT(*)AS recent_order
FROM sales_analysis
WHERE 	order_date_date >=CURRENT_DATE- INTERVAL '60 days'
   


