CREATE TABLE "Employee" (
  "Employee_ID" integer PRIMARY KEY,
  "First_Name" varchar,
  "Last_Name" varchar,
  "Employment_Type" varchar,
  "Job_Position_ID" integer,
  "Deparment_ID" integer
);

CREATE TABLE "Department" (
  "Deparment_ID" integer PRIMARY KEY,
  "Dewpartment_Name" varchar
);

CREATE TABLE "Job_Position" (
  "Job_Position_ID" integer PRIMARY KEY,
  "Job_Title" varchar
);

CREATE TABLE "Payroll" (
  "Payroll_ID" integer PRIMARY KEY,
  "Employee_ID" integer,
  "Monthly_salary" varchar,
  "Hourly_rate" varchar,
  "created_at" timestamp
);

CREATE TABLE "Leave_Request" (
  "Leave_Request_ID" integer PRIMARY KEY,
  "Employee_ID" integer,
  "Request_Date" timestamp,
  "Start_Date" timestamp,
  "End_Date" timestamp,
  "Status" varchar
);

CREATE TABLE "Training_Session" (
  "Training_Session_ID" integer PRIMARY KEY,
  "Session_Name" varchar,
  "Session_Date" timestamp
);

CREATE TABLE "Attendance_Record" (
  "Attendance_Record_ID" integer PRIMARY KEY,
  "Employee_ID" integer,
  "Training_Session_ID" integer,
  "Attendance_Date" timestamp
);

ALTER TABLE "Employee" ADD FOREIGN KEY ("Job_Position_ID") REFERENCES "Job_Position" ("Job_Position_ID");

ALTER TABLE "Employee" ADD FOREIGN KEY ("Deparment_ID") REFERENCES "Department" ("Deparment_ID");

ALTER TABLE "Payroll" ADD FOREIGN KEY ("Hourly_rate") REFERENCES "Employee" ("Employment_Type");

ALTER TABLE "Payroll" ADD FOREIGN KEY ("Monthly_salary") REFERENCES "Employee" ("Employment_Type");

ALTER TABLE "Leave_Request" ADD FOREIGN KEY ("Employee_ID") REFERENCES "Employee" ("Employee_ID");

ALTER TABLE "Attendance_Record" ADD FOREIGN KEY ("Training_Session_ID") REFERENCES "Training_Session" ("Training_Session_ID");

ALTER TABLE "Attendance_Record" ADD FOREIGN KEY ("Employee_ID") REFERENCES "Employee" ("Employee_ID");
