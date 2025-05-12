update employees
set salary_yen = salary_yen+300000
where salary_yen < (select avg(salary_yen) from employees)
RETURNING emp_id, full_name, salary_yen;