DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-18', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-18', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-20', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-25', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-11-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-11-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-11-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-11-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-11-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-11-03', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-11-03', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-11-03', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-11-04', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-11-05', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-11-05', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-11-10', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-11-10', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-11-15', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-11-28', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-11-28', 'sp' , NULL        )
;
select * from mst_users;
select * from action_log;

with
mst_users_with_year_month as (
	select
		*
		,substr(register_date,1,7) as year_month
	from
		mst_users)
select
	year_month
	,count(distinct user_id) as register_count
	,lag(count(distinct user_id)) over(order by year_month) as last_month_count
	,round(100.0 * count(distinct user_id) / lag(count(distinct user_id)) over(order by year_month),2) as month_over_month_ratio
from
	mst_users_with_year_month
group by
	year_month;
with
mst_users_with_year_month as (
	select
		*
		,substr(register_date,1,7) as year_month
	from
		mst_users)
select
	year_month
	,count(distinct user_id) as register_count
	,count(distinct case when register_device = 'pc' then user_id end) as register_pc
	,count(distinct case when register_device = 'sp' then user_id end) as register_sp
	,count(distinct case when register_device = 'app' then user_id end) as register_app
from
	mst_users_with_year_month
group by
	year_month
