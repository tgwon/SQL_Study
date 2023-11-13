DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , register_date   varchar(255)
  , register_device integer
);

INSERT INTO mst_users
VALUES
    ('U001', '2016-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
;

select * from mst_users;

select
	user_id,
	case
	when register_device=1 then '데스트톱'
	when register_device=2 then '스마트폰'
	when register_device=3 then '애플리케이션'
	-- 주석은 #이 아니라 "--"
	end as device_name
	
from mst_users;
