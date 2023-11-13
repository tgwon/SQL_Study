DROP TABLE IF EXISTS mst_user_location;
CREATE TABLE mst_user_location (
    user_id   varchar(255)
  , pref_name varchar(255)
  , city_name varchar(255)
);

INSERT INTO mst_user_location
VALUES
    ('U001', '서울특별시', '강서구')
  , ('U002', '경기도수원시', '장안구'  )
  , ('U003', '제주특별자치도', '서귀포시')
;

select * from mst_user_location;

select
	user_id,
	concat(pref_name,city_name) as pref_city1,
	concat(pref_name,' ',city_name) as pref_city2,
	pref_name || city_name as pref_city3,
	concat(pref_name, concat(pref_name,city_name)) as pref_city4
	
from mst_user_location;