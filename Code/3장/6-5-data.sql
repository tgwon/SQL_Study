DROP TABLE IF EXISTS mst_users_with_dates;
CREATE TABLE mst_users_with_dates (
    user_id        varchar(255)
  , register_stamp varchar(255)
  , birth_date     varchar(255)
);

INSERT INTO mst_users_with_dates
VALUES
    ('U001', '2016-02-28 10:00:00', '2000-02-29')
  , ('U002', '2016-02-29 10:00:00', '2000-02-29')
  , ('U003', '2016-03-01 10:00:00', '2000-02-29')
;

select * from mst_users_with_dates;

select
	user_id,
	register_stamp::timestamp as register_stamp,
	-- :: register_stamp를 timestamp 형식으로 변환, 문자형에서 timestamp로 바뀜
	
	register_stamp::timestamp + '1 hour' ::interval as after_1_hour,
	-- :: register_stamp를 timestamp 형식으로 변환후, 1 hour를 interval(시간간격)형식으로 변환 후 더해줌
	-- 단위 없이 숫자만 적으면 '초'
	-- hour 나 hours 둘다 됨
	-- 즉, 1시간 이후의 시간
	
	'1 hour' ::interval
from
	mst_users_with_dates;