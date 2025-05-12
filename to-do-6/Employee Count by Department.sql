SELECT
    dept_id,
    COUNT(*) AS num_employees 
FROM
    employees
GROUP BY
    dept_id
ORDER BY
    dept_id;