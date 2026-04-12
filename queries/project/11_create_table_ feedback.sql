CREATE TABLE analytics.feedback(
	student_id INT,
	campus_facilities_rating INT,
	teaching_quality_rating INT,
	overall_satisfaction VARCHAR(50),
	FOREIGN KEY(student_id) REFERENCES students(student_id)
);





