DROP TABLE IF EXISTS dup_action_log;
CREATE TABLE dup_action_log(
    stamp     varchar(255)
  , session   varchar(255)
  , user_id   varchar(255)
  , action    varchar(255)
  , products  varchar(255)
);

INSERT INTO dup_action_log
VALUES
    ('2016-11-03 18:00:00', '989004ea', 'U001', 'click', 'D001')
  , ('2016-11-03 19:00:00', '47db0370', 'U002', 'click', 'D002')
  , ('2016-11-03 20:00:00', '1cf7678e', 'U003', 'click', 'A001')
  , ('2016-11-03 21:00:00', '5eb2e107', 'U004', 'click', 'A001')
  , ('2016-11-03 21:00:00', 'fe05e1d8', 'U004', 'click', 'D001')
  , ('2016-11-04 18:00:00', '87b5725f', 'U001', 'click', 'D001')
  , ('2016-11-04 19:00:00', 'eee2bb21', 'U005', 'click', 'A001')
  , ('2016-11-04 20:00:00', '5d5b0997', 'U006', 'click', 'D001')
  , ('2016-11-04 21:00:00', '111f2996', 'U007', 'click', 'D002')
  , ('2016-11-04 22:00:00', '3efe001c', 'U008', 'click', 'A001')
  , ('2016-11-04 22:00:10', '3efe001c', 'U008', 'click', 'A001')
;

select * from dup_action_log;
select
	user_id
	,products
	,string_agg(session,',') as session_list
	,string_agg(stamp, ',') as stamp_list
from
	dup_action_log
group by
	user_id, products
having
	count(*) > 1;
	
	
select
	session
	,user_id
	,action
	,products
	,min(stamp) as stamp
from
	dup_action_log
group by
	session, user_id, action, products;
	
WITH
dup_action_log_with_order_num as(
select
	*
	, row_number()
		over(
		partition by session, user_id, action, products
		order by stamp
		) as order_num
from
	dup_action_log
)
select
	session
	,user_id
	,action
	,products
	,stamp
from
	dup_action_log_with_order_num
where
	order_num = 1;
	