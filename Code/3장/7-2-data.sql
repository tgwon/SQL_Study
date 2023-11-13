DROP TABLE IF EXISTS popular_products;
CREATE TABLE popular_products (
    product_id varchar(255)
  , category   varchar(255)
  , score      numeric
);

INSERT INTO popular_products
VALUES
    ('A001', 'action', 94)
  , ('A002', 'action', 81)
  , ('A003', 'action', 78)
  , ('A004', 'action', 64)
  , ('D001', 'drama' , 90)
  , ('D002', 'drama' , 82)
  , ('D003', 'drama' , 78)
  , ('D004', 'drama' , 58)
;

select
	product_id,
	score,
	row_number() over(order by score desc) as row,
	rank() over(order by score desc) as rank, 
	dense_rank() over(order by score desc) as dense_rank,
	
	lag(product_id) over(order by score desc) as lag1,
	lag(product_id,2) over(order by score desc) as lag2,
	lead(product_id) over(order by score desc) as lead1,
	lead(product_id,2) over(order by score desc) as lead2
from
	popular_products;
	
select
	product_id
	,score
	,row_number() over(order by score desc) as row
	,sum(score) over(order by score desc
		rows between unbounded preceding and current row) as cum_score
	,avg(score) over(order by score desc
		rows between 1 preceding and 1 following) as local_avg
	,FIRST_VALUE(product_id) over(order by score desc
		rows between unbounded preceding and unbounded following) as first_value
	,array_agg(product_id) over(order by score desc
		rows unbounded preceding)
from
	popular_products;
	
select distinct
	category
	,first_value(product_id)
		over(partition by category order by score desc
			rows between unbounded preceding and unbounded following) as product_id
from
	popular_products;