-- 2.Clean data (remove duplicates, nulls) & 3.Transform and move to production tables.
-- Clean and transform data from `staging_employees` to `employees`

INSERT INTO employees(emp_id, name, age, department, salary)
SELECT DISTINCT CAST(id AS INT), name, CAST(age AS INT), department, CAST(salary AS NUMERIC(10,2))
FROM public.staging_employees
WHERE id IS NOT NULL AND name IS NOT NULL;

-- Display `employees` table
SELECT * FROM employees;

TRUNCATE TABLE employees;