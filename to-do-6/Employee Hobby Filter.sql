select
  full_name,
  profile ->> 'hobby' as hobby
from
  employees
where
  profile ->> 'hobby' ilike '%guitar%'