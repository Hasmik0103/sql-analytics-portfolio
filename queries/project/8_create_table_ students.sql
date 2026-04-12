DROP TABLE IF EXISTS analytics.students
CREATE TABLE analytics.students(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100) UNIQUE,
	age  INT,
	gender VARCHAR(10),
	country VARCHAR(50)
	
);

