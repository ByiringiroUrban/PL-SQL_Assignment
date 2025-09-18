
# Names: 
## Byiringiro Urbain Bobola 27150
## Serutamba heritier 27141
## Mwungeri Bonheur 29337
## Gakiza Lievin     28391


-- 1. students
CREATE TABLE students (
  student_id   SERIAL PRIMARY KEY,
  first_name   VARCHAR(50) NOT NULL,
  last_name    VARCHAR(50) NOT NULL,
  email        VARCHAR(150) UNIQUE NOT NULL,
  dob          DATE,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. courses
CREATE TABLE courses (
  course_id    SERIAL PRIMARY KEY,
  course_name  VARCHAR(150) NOT NULL,
  description  TEXT,
  credits      SMALLINT NOT NULL DEFAULT 3 CHECK (credits > 0),
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. enrollments (join table)
CREATE TABLE enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id    INT NOT NULL REFERENCES students(student_id) ON DELETE CASCADE,
  course_id     INT NOT NULL REFERENCES courses(course_id) ON DELETE CASCADE,
  enrollment_date DATE DEFAULT CURRENT_DATE,
  grade         CHAR(2),
  -- prevent duplicate enrollments for same student/course:
  UNIQUE (student_id, course_id),
  -- optional grade check
  CHECK (grade IS NULL OR grade IN ('A','B','C','D','F'))
);


-- Joins — SQL + explanation

SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;



SELECT s.student_id, s.first_name, c.course_name, e.grade
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id;


SELECT c.course_id, c.course_name, e.enrollment_id, s.first_name
FROM enrollments e
RIGHT JOIN courses c ON e.course_id = c.course_id
LEFT JOIN students s ON e.student_id = s.student_id
ORDER BY c.course_id;



-- Show all students and all enrollments combined:
SELECT s.student_id, s.first_name, e.enrollment_id, e.course_id
FROM students s
FULL OUTER JOIN enrollments e ON s.student_id = e.student_id
ORDER BY COALESCE(s.student_id, e.student_id);




SELECT s.student_id, s.first_name, e.enrollment_id
FROM students s LEFT JOIN enrollments e ON s.student_id = e.student_id
UNION
SELECT s.student_id, s.first_name, e.enrollment_id
FROM students s RIGHT JOIN enrollments e ON s.student_id = e.student_id;





-- Indexes to speed up joins and lookups:
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_course  ON enrollments(course_id);

-- Composite unique index already created by UNIQUE constraint:
-- (UNIQUE (student_id, course_id)) enforces uniqueness.



EXPLAIN ANALYZE
SELECT s.first_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;



CREATE VIEW student_course_view AS
SELECT s.student_id,
       s.first_name,
       s.last_name,
       s.email,
       c.course_id,
       c.course_name,
       e.enrollment_date,
       e.grade
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;
