{{ config(materialized='view', schema='visualization') }}

select 	 date_part('year', stat_datetime) as year
		,date_part('month', stat_datetime) as month
		,sum(total_tested) as total_tested_world
		,sum(total_confirmed) as total_confirmed_world
		,sum(total_recovered) as total_recovered_world 
from  {{ ref('stg_covid_epidemiology')}}     
group by
	 date_part('year', stat_datetime)
	,date_part('month', stat_datetime)  
