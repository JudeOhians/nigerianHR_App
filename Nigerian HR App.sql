CREATE TABLE "Employee" (
  "Employee_ID" integer PRIMARY KEY,
  "First_Name" varchar,
  "Last_Name" varchar,
  "Job_Position_ID" integer,
  "Employment_Type" varchar
);

CREATE TABLE "Department" (
  "Deparment_ID" integer PRIMARY KEY,
  "Dewpartment_Name" varchar,
  "Employee" varchar
);

CREATE TABLE "Job_Position" (
  "Job_Position_ID" integer PRIMARY KEY,
  "Job_Title" varchar
);

CREATE TABLE "Payroll" (
  "Payroll_ID" integer PRIMARY KEY,
  "Employee_ID" varchar,
  "Monthly_salary" varchar,
  "Hourly_rate" varchar,
  "created_at" timestamp
);

CREATE TABLE "Leave_Request" (
  "Leave_Request_ID" integer PRIMARY KEY,
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
  "Employee_ID" varchar,
  "Attendance_Date" timestamp
);

ALTER TABLE "Department" ADD FOREIGN KEY ("Employee") REFERENCES "Employee" ("Employee_ID");

ALTER TABLE "Employee" ADD FOREIGN KEY ("Job_Position_ID") REFERENCES "Job_Position" ("Job_Position_ID");

ALTER TABLE "Leave_Request" ADD FOREIGN KEY ("Leave_Request_ID") REFERENCES "Employee" ("Employee_ID");

CREATE TABLE "Attendance_Record_Training_Session" (
  "Attendance_Record_Attendance_Record_ID" integer,
  "Training_Session_Training_Session_ID" integer,
  PRIMARY KEY ("Attendance_Record_Attendance_Record_ID", "Training_Session_Training_Session_ID")
);

ALTER TABLE "Attendance_Record_Training_Session" ADD FOREIGN KEY ("Attendance_Record_Attendance_Record_ID") REFERENCES "Attendance_Record" ("Attendance_Record_ID");

ALTER TABLE "Attendance_Record_Training_Session" ADD FOREIGN KEY ("Training_Session_Training_Session_ID") REFERENCES "Training_Session" ("Training_Session_ID");


ALTER TABLE "Attendance_Record" ADD FOREIGN KEY ("Employee_ID") REFERENCES "Employee" ("Employee_ID");

CREATE TABLE "Employee_Attendance_Record" (
  "Employee_Employee_ID" integer,
  "Attendance_Record_Attendance_Record_ID" integer,
  PRIMARY KEY ("Employee_Employee_ID", "Attendance_Record_Attendance_Record_ID")
);

ALTER TABLE "Employee_Attendance_Record" ADD FOREIGN KEY ("Employee_Employee_ID") REFERENCES "Employee" ("Employee_ID");

ALTER TABLE "Employee_Attendance_Record" ADD FOREIGN KEY ("Attendance_Record_Attendance_Record_ID") REFERENCES "Attendance_Record" ("Attendance_Record_ID");


ALTER TABLE "Payroll" ADD FOREIGN KEY ("Hourly_rate") REFERENCES "Employee" ("Employment_Type");

ALTER TABLE "Payroll" ADD FOREIGN KEY ("Monthly_salary") REFERENCES "Employee" ("Employment_Type");
