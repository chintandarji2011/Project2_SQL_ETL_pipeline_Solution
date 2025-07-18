# Project2_SQL_ETL_pipeline_Solution
Author: Darji Chintankumar Dineshchandra

---

# SQL ETL Pipeline Simulation

## **Project Overview**

This project demonstrates a simple **ETL (Extract, Transform, Load)** pipeline built entirely in **PostgreSQL**. The pipeline loads raw CSV data into a staging table, cleans and transforms it, moves it into a production table, logs all ETL operations in an audit table, and finally exports the cleaned data and logs back to CSV files.

---

##  **Tools Used**

* **PostgreSQL** (tested with pgAdmin 4)
* **SQL/PLpgSQL**
* Raw CSV files (as input data)

---
##  Folder Structure Suggestion
```sql
/*
etl_pipeline_project/
│
├── raw_data/                  # CSV files
│   ├── employees_raw.csv (Path: 'D:\')
|   └── employees_raw_2.csv (Path: 'D:\')
│
├── scripts/
│   ├── 01_Create_Table.sql
│   ├── 02_import_data.sql
│   ├── 03_trg_insert_data_log_cleanup_staging.sql
│   ├── 04_ Export_final_data_logs_to_csv.sql
│   └── Inventory_queries.sql
│    
├── output/
│   ├── Final_employees.csv (Path: 'D:\ETL_sql_project_file\')
│   └── Final_etl_audit_log.csv (Path: 'D:\ETL_sql_project_file\')
└── README.md
*/
```
> Note: Make sure the folder exists: `D:\ETL_sql_project_file\` for Output, Because the PostgreSQL server process (the postgres service) does not have permission to write/create to that folder.

## **Project Structure**

* **01\_Create\_Table.sql**
  Defines the **staging table**, **production table**, and **ETL audit log table**.
* **02\_import\_data.sql**
  Contains a stored procedure `load_staging_employees` for importing raw CSV data into the staging table.
* **03\_trg\_insert\_data\_log\_cleanup\_staging.sql**
  Defines a trigger function `Clean_Transform_data_insert_log_clear_staging` that:

  * Cleans & transforms raw data.
  * Inserts cleaned data into the production table.
  * Logs the action into the audit table.
  * Clears the staging table.
* **04\_Export\_final\_data\_logs\_to\_csv.sql**
  Provides procedures to export:

  * Final cleaned **employees** table.
  * **ETL audit logs**.
* **Inventory\_queries.sql**
  Shows how to execute the procedures step-by-step and verify tables.

---

## **How it Works**

1️) **Load Raw Data**
Use the procedure `load_staging_employees` to import CSV files into the staging table.

```sql
CALL public.load_staging_employees('D:\\employees_raw.csv');
CALL public.load_staging_employees('D:\\employees_raw_2.csv');
```

2️) **Transform, Log & Cleanup**
A trigger `trg_insert_data_log_cleanup_staging` automatically:

* Cleans & moves distinct, valid data to the **employees** table.
* Inserts an entry into **etl\_audit\_log**.
* Clears the staging table.

3️) **Export Final Data**
Export cleaned data and logs to CSV:

```sql
CALL public.export_final_table('D:\\ETL_sql_project_file\\Final_employees.csv');
CALL public.export_audit_table('D:\\ETL_sql_project_file\\Final_etl_audit_log.csv');
```

---

##  **Key Features**

* **End-to-End ETL in SQL**: No external tools/scripts needed.
* **Fully Automated**: Using triggers for transformation, logging, and cleanup.
* **Reusable Procedures**: Import/export data with parameterized procedures.

---

##  **How to Run**

1. Create the tables using `01_Create_Table.sql`.
2. Create the **import**, **transform**, and **export** procedures using scripts `02` to `04`.
3. Run `Inventory_queries.sql` to:

   * Load data.
   * Export final tables.
   * Test/verify the process.

---

## **Testing Queries**

* Display staging, production, or audit tables.
* Clear tables as needed to rerun the pipeline.
* Can also reset the identity of Audit table Primary key column (`lig_id`).

---

##  **Deliverables**

- SQL scripts
- Staging, production, and audit tables
- Exported CSVs (clean data + logs)

---

##  **Credits**

**Author:** *Darji Chintankumar Dineshchandra*
<br>
**Database:** PostgreSQL (pgAdmin 4)

---


