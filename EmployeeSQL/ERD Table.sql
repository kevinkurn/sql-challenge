-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "department_id" VARCHAR   NOT NULL,
    "department_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "department_employees" (
    "employee_id" int   NOT NULL,
    "department_id" VARCHAR   NOT NULL
);

CREATE TABLE "department_manager" (
    "department_id" VARCHAR   NOT NULL,
    "employee_id" INT   NOT NULL
);

CREATE TABLE "employees" (
    "employee_id" INT   NOT NULL,
    "employee_title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id"
     )
);

-- try the below code to allow employees csv to be uploaded into employee table. previously there is an issue whereby the formatting of birth_date and hire_date cannot be accepted
-- ALTER TABLE employees
-- ALTER COLUMN hire_date TYPE DATE
-- USING TO_DATE(hire_date, 'mm/dd/yyyy');

CREATE TABLE "salaries" (
    "employee_id" INT   NOT NULL,
    "salary" NUMERIC   NOT NULL
);

CREATE TABLE "job_title" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_job_title" PRIMARY KEY (
        "title_id"
     )
);

-- NOTE: the below foreign key constraint is added after uploading csv file into the above tables

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_id" FOREIGN KEY("department_id")
REFERENCES "Departments" ("department_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employee_title_id" FOREIGN KEY("employee_title_id")
REFERENCES "job_title" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

-- added primary key constraint for junction table department employee
-- note that this table shows many-to-many data relationship
ALTER TABLE "department_employees" ADD CONSTRAINT "pk_department_employees_department_id"
PRIMARY KEY (employee_id, department_id)