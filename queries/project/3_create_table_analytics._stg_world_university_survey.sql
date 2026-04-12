DROP TABLE IF EXISTS analytics._stg_world_university_survey
CREATE TABLE analytics._stg_world_university_survey (
	student_id		int,
	student_name	varchar(50),
	age				int,
	gender			varchar(50),
	country			varchar(50),
	university		varchar(50),
	progtam_level	varchar(50),
	field_of_study	varchar(50),
	year_of_study	int,
	tuition_usd		int,
	scholrship		boolean,
	online_classes	boolean,
	campus_facilities_rating  int,
	teaching_quality_rating   int,
	overall_satisfaction varchar(50)
);
