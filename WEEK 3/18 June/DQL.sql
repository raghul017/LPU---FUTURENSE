USE university_db;

-- String Functions:
-- 1) Concatenate the first name and last name of students.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM students;

-- 2) Convert the course names to uppercase.
SELECT UPPER(course_name) AS upper_course_name
FROM courses;

-- 3) Find the position of 'a' in student emails.
SELECT email, INSTR(email, 'a') AS position_of_a
FROM students;

-- 4) Extract the first 5 characters of course descriptions.
SELECT SUBSTR(description, 1, 5) AS short_description
FROM courses;

-- 5) Trim leading and trailing spaces from student addresses.
SELECT TRIM(address) AS trimmed_address
FROM students;

-- Date and Time Functions:
-- 6) Get the current date and time.
SELECT SYSDATE() AS current_timestamp;

-- 7) Calculate the number of days between the enrollment date and the current date.
SELECT enrollment_id, DATEDIFF(CURRENT_DATE(), enrollment_date) AS days_since_enrollment
FROM enrollments;

-- 8) Find the last day of the month for enrollment dates.
SELECT enrollment_id, LAST_DAY(enrollment_date) AS last_day_of_enrollment_month
FROM enrollments;

-- Numeric Functions:
-- 9) Find the average grade in a course.
SELECT AVG(grade) AS average_grade
FROM grades;

-- 10) Calculate the square root of the number of credits for courses.
SELECT course_id, course_name, SQRT(credits) AS sqrt_credits
FROM courses;
