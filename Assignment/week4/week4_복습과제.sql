DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
);

INSERT INTO mst_users
VALUES
    ('yhj', 'F', '1988-06-17')
  , ('jks', 'F', '1969-09-24')
  , ('jbs', 'M', '1998-08-25')
  , ('ytg', 'F', '2000-05-21')
  , ('kge', 'M', '1985-11-23')
  , ('pce', 'F', '1998-01-21')
  , ('jyj', 'F', '2001-05-30')
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'yhj', 'purchase', 'drama')
  , ('989004ea', 'yhj', 'view'    , 'action')
  , ('989004ea', 'jks', 'favorite', 'drama' )
  , ('989004ea', 'jks', 'review'  , 'romance' )
  , ('989004ea', 'jks', 'add_cart', 'action' )
  , ('989004ea', 'jks', 'purchase', 'drama' )
  , ('989004ea', 'jks', 'purchase', 'drama' )
  , ('989004ea', 'ytg', 'add_cart', 'romance' )
  , ('989004ea', 'jks', 'purchase', 'romance' )
  , ('989004ea', 'jbs', 'add_cart', 'romance' )
  , ('989004ea', 'jks', 'add_cart', 'action' )
  , ('989004ea', 'ytg', 'purchase', 'drama' )
  , ('47db0370', 'ytg', 'add_cart', 'action' )
  , ('47db0370', 'jyj', 'purchase', 'drama' )
  , ('47db0370', 'kge', 'add_cart', 'drama' )
  , ('87b5725f', 'pce', 'purchase', 'action')
  , ('87b5725f', 'pce', 'add_cart', 'action')
  , ('87b5725f', 'yhj', 'add_cart', 'action')
  , ('9afaf87c', 'jyj', 'purchase', 'drama' )
  , ('9afaf87c', 'jyj', 'purchase', 'action')
;


WITH
mst_users_with_int_birth_date AS(
	SELECT
		*
	-- 특정 날짜(2023년 10월 2일)의 정수표현
		, ???? AS int_specific_date
	-- 문자열로 구성된 생년월일을 정수 표현으로 변환하기
		, CAST(???? AS integer) AS int_birth_date 
	FROM
		mst_users
)
, mst_users_with_age AS (
	SELECT
		*
	-- 특정 날짜(2023년 10월 2일)의 나이
		, floor((???? - ????) / ????) AS age
	FROM
		mst_users_with_int_birth_date
)
, mst_users_with_category AS(
	SELECT
		user_id
		, sex
		, age
		, ???? (
				CASE
					WHEN ???? <= age THEN sex
					ELSE ''
				END
				, CASE
						WHEN age BETWEEN 4 AND 12 THEN ???? 
						WHEN age BETWEEN 13 AND 19 THEN ????
						WHEN age BETWEEN 20 AND 34 THEN ????
						WHEN age BETWEEN 35 AND 49 THEN ????
						WHEN age >= 50 THEN ????
					END
				) AS category
	FROM
		mst_users_with_age
)

SELECT
	p.category AS product_category
	, u.category AS user_category
	, ???? AS purchase_count
FROM
	action_log AS p
	????
	mst_users_with_category AS u
	ON ????
WHERE
	-- 구매로그만 선택하기
	action = ????
GROUP BY
p.category, u.category
ORDER BY
	p.category, u.category
;