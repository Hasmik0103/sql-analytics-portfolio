COPY analytics._stg_world_university_survey
FROM '/docker-entrypoint-initdb.d/data/world_university_survey/world_university_survey_dataset.csv'
CSV HEADER
NULL 'NULL';
