with CTE AS (
select * 
from {{ source('demo', 'weather') }}
)

select * from CTE 