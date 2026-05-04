SELECT   *
FROM analytics._stg_world_university_survey;



-- GROUP BY AGE GROUP
SELECT
	MIN(age),
	MAX(age)
FROM analytics._stg_world_university_survey;	
	




SELECT 
  CASE 
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 24 THEN '20-24'
    WHEN age BETWEEN 25 AND 29 THEN '25-29'
    ELSE '30+'
  END AS age_group,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY age_group
;
-- GROUP BY FIELD OF STUDY
SELECT 
  field_of_study,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY field_of_study
ORDER BY total_students DESC;

-- GROUP BY PROGRAM LEVEL
SELECT 
  progtam_level,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY progtam_level
ORDER BY total_students DESC;

-- GROUP BY ONLINE/OFFLINE
SELECT 
  online_classes,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY online_classes;


-- GROUP BY OVERALL SATISFACTION
SELECT 
  overall_satisfaction,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY overall_satisfaction
ORDER BY total_students DESC;





SELECT 
    online_classes,
    overall_satisfaction,
    COUNT(*) AS total_students,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY online_classes),2
    ) AS percentage
FROM analytics._stg_world_university_survey
GROUP BY online_classes, overall_satisfaction
ORDER BY online_classes, percentage DESC;




-- GROUP BY country
SELECT 
  country,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY country;


-- GROUP BY university
SELECT 
 university,
  COUNT(*) AS total_students
FROM analytics._stg_world_university_survey
GROUP BY university;




