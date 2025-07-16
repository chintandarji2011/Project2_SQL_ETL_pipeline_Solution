-- 6.Export final tables and documentation.
-- Export final tables and documentation

COPY employees TO 'D:\ETL_sql_project_file\Final_employees.csv' DELIMITER ',' CSV HEADER;

COPY etl_audit_log TO 'D:\ETL_sql_project_file\Final_etl_audit_log.csv' DELIMITER ',' CSV HEADER;