with bike as (

    select distinct 
    start_station_id As station_id,
    start_station_name,
    start_lat, 
    start_lng
    from {{ source('demo', 'bike') }}
    where station_id is not null

)

select * from bike 