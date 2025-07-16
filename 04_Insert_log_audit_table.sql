-- 4.Create audit table for tracking insert logs.
-- Insert Log in Audit Table

INSERT INTO public.etl_audit_log (action, affected_table, inserted_row)
SELECT 'Data Load', 'employees', COUNT(*) FROM employees;

-- Display `etl_audit_log` table

SELECT * FROM public.etl_audit_log;

-- clear the table data
TRUNCATE TABLE public.etl_audit_log;