DROP TABLE IF EXISTS analytics._stg_world_countries CASCADE;

CREATE TABLE analytics._stg_world_countries (
    country_name TEXT NOT NULL,
    country_code TEXT NOT NULL,
    geom geometry(MULTIPOLYGON, 4326) NOT NULL
);

SELECT student_id
  
FROM analytics._stg_world_university_survey a
LEFT JOIN analytics._stg_world_countries b on a.country=b.country_name
WHERE a.country IS NOT NULL;



SELECT 
  student_id
  -- a.country
  -- b.geom
FROM analytics._stg_world_university_survey a
LEFT JOIN analytics._stg_world_countries b 
  ON a.country = b.country_name
WHERE a.country IS NOT NULL;








SELECT student_id
FROM analytics._stg_world_university_survey a
LEFT JOIN analytics._stg_world_countries b 
  ON a.country = b.country_name
WHERE a.country IS NOT NULL;









SELECT * FROM analytics._stg_world_university_survey;



SELECT * FROM analytics._stg_world_countries;



INSERT INTO analytics._stg_world_countries (country_name,country_code, geom)
SELECT
    feature->'properties'->>'name' AS country_name,
    feature->>'id' AS country_code,
    ST_SetSRID(
        ST_Multi(
            ST_CollectionExtract(
                ST_Force2D(
                    ST_MakeValid(
                        ST_GeomFromGeoJSON(feature->>'geometry')
                    )
                ),
            3)
        ),
        4326
    ) AS geom
FROM (
    SELECT jsonb_array_elements(data->'features') AS feature
    FROM (
        SELECT pg_read_file('/docker-entrypoint-initdb.d/data/world_university_survey/countries.geo.json')::jsonb AS data
    ) f
) sub;