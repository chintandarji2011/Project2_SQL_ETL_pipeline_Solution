# Project2_SQL_ETL_pipeline_Solution
Author: Darji Chintankumar Dineshchandra

# SQL ETL Pipeline Project

## Objective
Simulate ETL using SQL and PostgreSQL.

##  Folder Structure Suggestion
```sql
etl_pipeline_project/
│
├── raw_data/                  # CSV files
│   ├── employees_raw.csv (Path: 'D:\')
|   └── employees_raw_2.csv (Path: 'D:\')
│
├── scripts/
│   ├── 01_Create_Table.sql
│   ├── 02_import_data.sql
│   ├── 03_clean_transform_data.sql
│   ├── 04_Insert_log_audit_table.sql
│   ├── 05_Create_trigger_on_Audit_table.sql
│   └── 06_export_final.sql
├── output/
│   ├── Final_employees.csv (Path: 'D:\ETL_sql_project_file\')
│   └── Final_etl_audit_log.csv (Path: 'D:\ETL_sql_project_file\')
└── README.md
```
> Note: Make sure the folder exists: `D:\ETL_sql_project_file\` for Output, Because the PostgreSQL server process (the postgres service) does not have permission to write/create to that folder.
## Steps Performed

1. Loaded raw data (CSV) into staging table.
2. Cleaned & validated data.
3. Transformed and inserted into production table.
4. Created audit logs for every insert.
5. Automated staging cleanup via trigger.
6. Exported the final cleaned dataset.

## Files
- `scripts/` – SQL files for each ETL step.
- `raw_data/` – Input CSV files.
- `output/` – Final exported data.

## Tables
- `staging_employees` – Raw data import.
- `employees` – Final cleaned data.
- `etl_audit_log` – Logs for ETL actions.

## Run Order
1. 01_create_tables.sql
2. 05_Create_trigger_on_Audit_table.sql
3. 02_import_data.sql
4. 03_clean_transform_data.sql
5. 04_Insert_log_audit_table.sql
6. 06_export_final.sql
