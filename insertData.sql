-- Students
INSERT INTO students (first_name,last_name,email,dob) VALUES
('Alice','Nguyen','alice@example.com','1999-04-12'),
('Bob','Smith','bob@example.com','2000-06-01'),
('Chloe','Kamanzi','chloe@example.com','1998-12-22');

-- Courses
INSERT INTO courses (course_name, description, credits) VALUES
('Intro to Python','Basics of Python',3),
('Web Development','HTML, CSS, JS',4),
('Databases','SQL & design',3);

-- Enrollments
-- Alice enrolled in Python and Web Development; Bob in Web Development; Chloe not enrolled
INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 2, NULL);
