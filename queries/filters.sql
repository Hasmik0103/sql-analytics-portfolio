SELECT
    transaction_id,
    city,
    category,
    total_sales,

    CASE
        WHEN total_sales > 1000
             AND discount BETWEEN 0 AND 0.10
             AND category = 'Electronics'
             AND city IN ('New York', 'Los Angeles', 'Chicago')
        THEN 'High Value Electronics - Low Discount'
        WHEN total_sales BETWEEN 500 AND 1000
             AND discount BETWEEN 0.10 AND 0.25
        THEN 'Medium Value - Moderate Discount'
        WHEN total_sales > 1500
             AND discount < 0.15
             AND category LIKE '%Tech%'
        THEN 'Premium Tech Segment'
        WHEN total_sales < 300
             OR discount > 0.40
        THEN 'Low Value / High Discount'
        ELSE 'Standard Segment'
    END AS business_segment
FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';
SELECT
    category,
    SUM(total_sales) AS total_category_sales,
    COUNT(transaction_id) AS number_of_transactions,
    AVG(discount) AS avg_discount,

    CASE
        WHEN SUM(total_sales) > 100000
        THEN 'Strong Performer'

        WHEN SUM(total_sales) BETWEEN 40000 AND 100000
        THEN 'Average Performer'

        ELSE 'Underperformer'
    END AS performance_label

FROM sales_analysis
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY category
HAVING COUNT(transaction_id) > 10
ORDER BY total_category_sales DESC;
SELECT
    city,
    COUNT(*) AS transaction_volume,

    CASE
        WHEN COUNT(*) > 200
        THEN 'High Activity'

        WHEN COUNT(*) BETWEEN 80 AND 200
        THEN 'Medium Activity'

        ELSE 'Low Activity'
    END AS activity_tier

FROM sales_analysis


WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'


GROUP BY city


HAVING COUNT(*) >= 20


ORDER BY transaction_volume DESC;
SELECT
    category,
    AVG(discount) AS avg_discount,
    SUM(total_sales) AS total_sales,

    CASE
        WHEN AVG(discount) > 0.30
        THEN 'Discount-Heavy'

        WHEN AVG(discount) BETWEEN 0.15 AND 0.30
        THEN 'Moderate Discount'

        ELSE 'Low or No Discount'
    END AS discount_behavior

FROM sales_analysis


WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'


GROUP BY category


HAVING COUNT(*) >= 15


ORDER BY avg_discount DESC;
