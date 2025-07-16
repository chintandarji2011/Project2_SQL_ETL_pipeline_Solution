-- 5.Automate cleanup using triggers.

-- Trigger to Clean Staging Table After Insert

-- create trigger function `clean_staging()`
CREATE OR REPLACE FUNCTION clean_staging()
RETURNS TRIGGER AS $$
BEGIN 
	DELETE FROM public.staging_employees;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Attach table to the Audit table insert trigger
CREATE TRIGGER trg_cleanup_staging
AFTER INSERT ON etl_audit_log
FOR EACH ROW
WHEN (NEW.action = 'Data load')
EXECUTE FUNCTION clean_staging();