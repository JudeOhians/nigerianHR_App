-- Drop tables if they exist
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS leave_requests CASCADE;
DROP TABLE IF EXISTS training_sessions CASCADE;
DROP TABLE IF EXISTS attendance_records CASCADE;


-- Create the Employees table
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  employee_type varchar(255) DEFAULT NULL,
  job_position_id int DEFAULT NULL,
  department_id int DEFAULT NULL
);

-- Create the Leave Requests table
CREATE TABLE leave_requests (
  leave_request_id SERIAL PRIMARY KEY,
  employee_id int DEFAULT NULL,
  request_date date DEFAULT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  status varchar(255) DEFAULT NULL
);

-- Create the Training Sessions table
CREATE TABLE training_sessions (
  training_session_id SERIAL PRIMARY KEY,
  session_name varchar(255) DEFAULT NULL,
  session_date date DEFAULT NULL
);

-- Create the Attendance Records table
CREATE TABLE attendance_records (
  attendance_record_id SERIAL PRIMARY KEY,
  employee_id int DEFAULT NULL,
  attendance_date date DEFAULT NULL
);

-- Add foreign keys to the Employees table
ALTER TABLE employees
  ADD CONSTRAINT fk_job_position FOREIGN KEY (job_position_id) REFERENCES job_positions(job_position_id),
  ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Add foreign keys to the Leave Requests table
ALTER TABLE leave_requests
  ADD CONSTRAINT fk_leave_request_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

-- Add foreign keys to the Attendance Records table
ALTER TABLE attendance_records
  ADD CONSTRAINT fk_attendance_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

-- Add data to the Employees table
INSERT INTO employees (first_name, last_name, employee_type, job_position_id, department_id)
VALUES
('John', 'Doe', 'Full-Time', 1, 1),
('Jane', 'Smith', 'Part-Time', 2, 2),
('Bob', 'Johnson', 'Full-Time', 3, 1);

-- Add data to the Leave Requests table
INSERT INTO leave_requests (employee_id, request_date, start_date, end_date, status)
VALUES
(1, '2023-09-01', '2023-09-10', '2023-09-15', 'Approved'),
(2, '2023-09-02', '2023-09-12', '2023-09-14', 'Pending');

-- Add data to the Training Sessions table
INSERT INTO training_sessions (session_name, session_date)
VALUES
('Session 1', '2023-09-05'),
('Session 2', '2023-09-10');

-- Add data to the Attendance Records table
INSERT INTO attendance_records (employee_id, attendance_date)
VALUES
(1, '2023-09-05'),
(1, '2023-09-10'),
(2, '2023-09-05');
