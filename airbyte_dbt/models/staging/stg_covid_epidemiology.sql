{{ config(materialized='table', schema='staging') }}

with renamed 
as
( 
    select  * 
    from    {{ source('public','covid_epidemiology') }}
)
select  cast("date" as timestamp) as stat_datetime
        ,new_recovered
        ,new_tested
        ,new_deceased
        ,new_confirmed
        ,total_deceased
        ,total_confirmed
        ,total_tested
        ,total_recovered
from renamed