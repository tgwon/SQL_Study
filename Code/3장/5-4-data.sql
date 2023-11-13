select
	current_date as dt1,
	current_timestamp as stamp1,
	cast('2023-09-09' as date) as dt2,
	cast('2023-09-09 12:00:00' as timestamp) as stamp2
;

select
	stamp,
	extract(year from stamp) as year,
	extract(month from stamp) as month,
	extract(day from stamp) as day,
	extract(hour from stamp) as hour
from
	(select cast('2022-06-29 12:00:00' as timestamp) as stamp);
	
select
	stamp,
	substring(stamp,1,4) as year,
	substring(stamp,6,2) as month,
	substring(stamp,9,2) as day,
	substring(stamp,12,2) as hour
from
	(select cast('2022-06-29 12:00:00' as text) as stamp);