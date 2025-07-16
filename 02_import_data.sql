-- 1. Import raw data (CSV) into staging tables.
COPY public.staging_employees FROM 'D:\employees_raw.csv' DELIMITER ',' CSV HEADER;
COPY public.staging_employees FROM 'D:\employees_raw_2.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM public.staging_employees;



