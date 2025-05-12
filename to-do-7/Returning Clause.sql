update employees
set is_active = false
where joined_on <= '2023-01-01'
RETURNING emp_id, full_name, is_active;