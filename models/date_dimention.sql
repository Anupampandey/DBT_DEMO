with cte as (
  select
    {{started_at_ts('started_at')}} as started_at,
    date({{started_at_ts('started_at')}}) as date_started_at,
    hour({{started_at_ts('started_at')}}) as hour_started_at,
    dayname(date({{started_at_ts('started_at')}})) as dayname,
    case
      when month({{started_at_ts('started_at')}}) in (12,1,2) then 'WINTER'
      when month({{started_at_ts('started_at')}}) in (3,4,5) then 'SPRING'
      when month({{started_at_ts('started_at')}}) in (6,7,8) then 'SUMMER'
      else 'AUTUMN'
    end as season_of_year,
/*  case when dayname in ('Sat','Sun') then 'Weekend' else 'Business_day' end as day_type, */
    {{ day_type('started_at') }} 

  from {{ source('demo', 'bike') }}
)

select * from cte