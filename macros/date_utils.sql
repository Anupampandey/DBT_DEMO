{% macro day_type(x) %}
CASE 
    WHEN DAYNAME(DATE(TO_TIMESTAMP({{ x }}))) IN ('Sat', 'Sun')
    THEN 'Weekend' ELSE 'Business_day'
    END as day_type
{% endmacro %}


{% macro started_at_ts(x) %}
TO_TIMESTAMP({{ x }})
{% endmacro %}