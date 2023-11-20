DROP TABLE IF EXISTS mst_categories;
CREATE TABLE mst_categories(
    id     integer
  , name   varchar(255)
  , stamp  varchar(255)
);

INSERT INTO mst_categories
VALUES
    (1, 'ladys_fashion', '2016-01-01 10:00:00')
  , (2, 'mens_fashion' , '2016-01-01 10:00:00')
  , (3, 'book'         , '2016-01-01 10:00:00')
  , (4, 'game'         , '2016-01-01 10:00:00')
  , (5, 'dvd'          , '2016-01-01 10:00:00')
  , (6, 'food'         , '2016-01-01 10:00:00')
  , (7, 'supplement'   , '2016-01-01 10:00:00')
  , (6, 'cooking'      , '2016-02-01 10:00:00')
;

SELECT * FROM mst_categories;

select
	count(1) as total_num
	,count(distinct id) as key_num
from
	mst_categories;
	
select
	id
	,count(*) as record_num
	,string_agg(name, ',') as name_list
	,string_agg(stamp, ',')  as stamp_list
from
	mst_categories
group by id
having count(*) >1;


with
mst_categories_with_key_num as(
select
	*
	, count(1) over(partition by id) as key_num
from
	mst_categories
)
select
	*
from
	mst_categories_with_key_num
where
	key_num > 1