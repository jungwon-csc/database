select full_name, salary_yen
from employees
where salary_yen > (select avg(salary_yen) from employees)