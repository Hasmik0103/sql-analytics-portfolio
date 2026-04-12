CREATE TABLE analytics.education_form(
	student_id INT,
	tuition_usd DECIMAL(10,2),
	scholrshop  BOOLEAN,
	FOREIGN KEY (student_id) REFERENCES students(student_id)
);
