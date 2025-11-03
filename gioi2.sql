CREATE SCHEMA elearning;

CREATE TABLE elearning.Students(
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE elearning.Instructors(
  instructor_id serial PRIMARY key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(100) not null unique
);

CREATE TABLE elearning.Courses(
  course_id serial PRIMARY key,
  course_name varchar(100) not null,
  instructor_id int REFERENCES elearning.Instructors(instructor_id)
);

CREATE TABLE elearning.Enrollments(
  enrollment_id serial PRIMARY key,
  student_id int REFERENCES elearning.Students(student_id),
  course_id int REFERENCES elearning.Courses(course_id),
  enroll_date date not null
);
CREATE TABLE elearning.Assignments(
  assignment_id serial PRIMARY key,
  course_id int REFERENCES elearning.Courses(course_id),
  title varchar(100) not null,
  due_date date not null
);

CREATE TABLE elearning.Submissions(
  submission_id serial PRIMARY key,
  assignment_id int REFERENCES elearning.Assignments(assignment_id),
  student_id int REFERENCES elearning.Students(student_id),
  submission_date date not null,
  grade NUMERIC(5,2) CHECK (grade >= 0 and grade <=100)
);





