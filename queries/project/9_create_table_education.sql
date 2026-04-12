CREATE TABLE analytics.education (
    student_id INT,
    university VARCHAR(100),
    program_level VARCHAR(50),
    field_of_study VARCHAR(100),
    year_of_study INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);