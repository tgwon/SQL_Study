DROP TABLE IF EXISTS quarterly_sales;
CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

INSERT INTO quarterly_sales
VALUES
    (2015, 82000, 83000, 78000, 83000)
  , (2016, 85000, 85000, 80000, 81000)
  , (2017, 92000, 81000, NULL , NULL )
;

select * from quarterly_sales;

select
	year,
	q1,
	q2,
	case
	when q1<q2 then '+'
	when q1>q2 then '-'
	else ' '
	end as judge_q1_q2,
	q2 - q1 as diff,
	sign(q2-q1) as sign_diff
from
	quarterly_sales
order by 
	year;
	
	
	
select
	year,
	greatest(q1,q2,q3,q4) as greatest_sales1,
	greatest(q1) as greatest_sales2,
	least(q1,q2,q3,q4) as least_sales,
	(q1+q2+q3+q4)/4 as average1,
	(coalesce(q1,0) + coalesce(q2,0) + coalesce(q3,0) + coalesce(q4,0))/4 as average2,
	(coalesce(q1,0) + coalesce(q2,0) + coalesce(q3,0) + coalesce(q4,0))
	/(sign(coalesce(q1,0)) + sign(coalesce(q2,0)) + sign(coalesce(q3,0)) + sign(coalesce(q4,0)))
	as average3
from
	quarterly_sales
order by
	year;

select max(q1) from quarterly_sales;

select max(q1), q2 from quarterly_sales group by q2;


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	