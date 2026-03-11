COPY analytics.orders
FROM '/data/orders.csv'
CSV HEADER;

SELECT * FROM analytics.orders LIMIT 10;
COPY analytics.order_items
FROM '/data/order_items.csv'
CSV HEADER;

SELECT * FROM analytics.order_items LIMIT 10;
