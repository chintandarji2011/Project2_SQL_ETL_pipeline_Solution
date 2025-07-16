/* Goal: Load raw CSV data into a postgreSQL database, 
clean/transform it, 
track changes via logs, and
prepare the final cleaned data */

-- staging table (RAW)
CREATE TABLE staging_employees 
(
	id TEXT,
	name TEXT,
	age TEXT,
	department TEXT,
	salary TEXT
);

-- Production table (cleaned)
CREATE TABLE employees
(
	emp_id INT PRIMARY KEY,
	name VARCHAR(100),
	age INT,
	department VARCHAR(100),
	salary NUMERIC(10,2),
	inserted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Audit Table
CREATE TABLE etl_audit_log
(
	log_id SERIAL PRIMARY KEY,
	action TEXT,
	affected_table TEXT,
	inserted_row INT,
	run_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
