SELECT
    full_name,
    email,
    joined_on
FROM
    employees
WHERE
    joined_on >= '2023-01-01'
    AND is_active = TRUE
ORDER BY
    joined_on DESC;

