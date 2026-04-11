
CREATE TEMP TABLE tmp_sales AS
SELECT *
FROM (
    VALUES
        
        (1,  'A', DATE '2024-01-01', 100, 2, 'Yerevan', 'online'),
        (2,  'A', DATE '2024-01-02', 120, 1, 'Yerevan', 'store'),
        (3,  'A', DATE '2024-01-03', 90,  3, 'Gyumri',  'online'),
        (4,  'A', DATE '2024-01-04', 130, 2, 'Gyumri',  'store'),

        
        (5,  'B', DATE '2024-01-01', 180, 4, 'Yerevan', 'store'),
        (6,  'B', DATE '2024-01-02', 200, 2, 'Vanadzor','online'),
        (7,  'B', DATE '2024-01-03', 220, 5, 'Vanadzor','online'),
        (8,  'B', DATE '2024-01-04', 200, 3, 'Yerevan', 'store'),

        
        (9,  'C', DATE '2024-01-01', 150, 2, 'Gyumri',  'online'),
        (10, 'C', DATE '2024-01-02', 150, 1, 'Gyumri',  'online'),
        (11, 'C', DATE '2024-01-03', 170, 3, 'Yerevan', 'online'),

        
        (12, 'D', DATE '2024-01-01', 90,  1, 'Vanadzor','store'),
        (13, 'D', DATE '2024-01-02', 110, 2, 'Vanadzor','store'),

        
        (14, 'E', DATE '2024-01-01', 140, 2, 'Yerevan', 'store'),
        (15, 'E', DATE '2024-01-02', 160, 3, 'Gyumri',  'online'),
        (16, 'E', DATE '2024-01-03', 155, 2, 'Yerevan', 'store')
) AS t(
    sale_id,
    customer_id,
    sale_date,
    amount,
    quantity,
    city,
    channel
);

SELECT
	sale_id,
	customer_id,
	sale_date,
	amount,
	AVG(amount) OVER (PARTITION BY customer_id) AS avg_costumer_amount
FROM tmp_sales;

SELECT
	customer_id, 
	amount,
	PERCENT_RANK() OVER (PARTITION BY  customer_id ORDER BY amount*5 DESC)
FROM tmp_sales;	


SELECT
	*,
	PERCENT_RANK() OVER (PARTITION BY  customer_id ORDER BY quantity*amount DESC) as  percent_rank_rev
FROM tmp_sales;	
SELECT
	sale_id,
	customer_id,
	sale_date,
	LAG(sale_date) OVER (
		PARTITION BY customer_id
		ORDER BY sale_date
	) AS previous_date
FROM tmp_sales;


WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.city_id,
        SUM(oi.quantity * p.price) AS total_spend
    FROM analytics.customers c
    JOIN analytics.orders o ON c.customer_id = o.customer_id
    JOIN analytics.order_items oi ON o.order_id = oi.order_id
    JOIN analytics.products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.city_id
),
city_agg AS (
    SELECT
        city_id,
       
        MAX(total_spend) AS max_city_spend
    FROM customer_spend
    GROUP BY city_id
)
SELECT
    *
FROM city_agg;
SELECT
	sale_id,
	customer_id,
	sale_date,
	amount,
	city_id
	DENSE_RANK()OVER (
		PARTITION BY city_id
		ORDER BY amount DESC
	) AS dense_rank_city
FROM tmp_sales;
SELECT
    sale_id,
    customer_id,
    amount,
	sale_date,
	city,
    DENSE_RANK() OVER (
        PARTITION BY city
		
        ORDER BY amount DESC
    ) AS dense_rank_amount
FROM tmp_sales;
SELECT
    sale_id,
    customer_id,
    sale_date,
    channel,
    STRING_AGG(channel, ', ') OVER (
        PARTITION BY customer_id
        ORDER BY sale_date
    ) AS channels_used_so_far

FROM tmp_sales;
SELECT
    
    customer_id,
    
    STRING_AGG(channel, ', 'ORDER BY channel) 
     AS channels_pattern
	
FROM tmp_sales
GROUP BY customer_id

