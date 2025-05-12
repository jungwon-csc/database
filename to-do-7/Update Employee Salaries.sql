update employees
SET salary_yen = salary_yen *1.05
WHERE dept_id = 1
RETURNING full_name, salary_yen; 