-- COPY analytics.orders
-- FROM '/data/orders.csv'
-- CSV HEADER;

-- SELECT * FROM analytics.orders LIMIT 10;
-- COPY analytics.order_items
-- FROM '/data/order_items.csv'
-- CSV HEADER;

-- SELECT * FROM analytics.order_items LIMIT 10;
SELECT
  COUNT(*) FILTER (WHERE ST_SRID(geom) = 4326) AS correct_srid,
  COUNT(*) AS total_geometries
FROM analytics.city_boundaries;