DROP TABLE IF EXISTS analytics.country CASCADE;

CREATE TABLE analytics.country (
    country_id SERIAL PRIMARY KEY, 
    country_name VARCHAR(50) UNIQUE NOT NULL
);



INSERT INTO analytics.country (country_name, geom)
SELECT
  DISTINCT
  a.customer_country,
  b.geom
FROM analytics._stg_rockbuster a
LEFT JOIN analytics._stg_world_countries b on (a.customer_country=b.country_name)
WHERE customer_country IS NOT NULL;




CREATE TABLE analytics._stg_world_countries (
    country_name TEXT NOT NULL,
    country_code TEXT NOT NULL,
    geom geometry(MULTIPOLYGON, 4326) NOT NULL
);