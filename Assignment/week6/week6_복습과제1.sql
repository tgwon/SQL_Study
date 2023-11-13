WITH request(user_id, product_id, request_date) AS (
    VALUES
    ('U001', '1', date '2016-09-01'),
    ('U001', '2', date '2016-09-20'),
    ('U002', '3', date '2016-09-30'),
    ('U003', '4', date '2016-10-01'),
    ('U004', '5', date '2016-11-01'),
    ('U005', '6', date '2016-11-15'),
    ('U006', '7', date '2016-11-20'),
    ('U007', '8', date '2016-12-01'),
    ('U008', '9', date '2016-12-10'),
    ('U009', '10', date '2016-12-20')
),
estimates(user_id, product_id, estimate_date) AS (
    VALUES
	('U001', '1', date '2016-09-02'),
    ('U001', '2', date '2016-09-21'),
    ('U002', '3', date '2016-10-01'),
    ('U003', '4', date '2016-10-01'),
    ('U004', '5', date '2016-11-08'),
    ('U005', '6', date '2016-11-17'),
    ('U006', '7', date '2016-11-22'),
    ('U007', '8', date '2016-12-08'),
    ('U008', '9', date '2016-12-14'),
    ('U009', '10', date '2016-12-22')
),
orders(user_id, product_id, order_date) AS (
    VALUES
	('U001', '1', date '2016-09-03'),
    ('U001', '2', date '2016-09-23'),
    ('U002', '3', date '2016-10-01'),
    ('U003', '4', date '2016-10-02'),
    ('U004', '5', date '2016-11-20'),
    ('U005', '6', date '2016-11-18'),
    ('U006', '7', date '2016-11-20'),
    ('U007', '8', date '2016-12-09'),
    ('U008', '9', date '2016-12-15'),
    ('U009', '10', date '2016-12-24')
) 

select 
r.user_id, r.product_id
-- 날짜의 차이로 estimate_lead_time 구하기
, ?? - ?? as estimate_lead_time
-- 날짜의 차이로 order_lead_time 구하기
, o.order_date::date - e.estimate_date::date as order_lead_time
-- 날짜의 차이로 total_lead_time 구하기
, ?? - ?? as total_lead_time

from request as r ??? ???? ???? estimates as e 
?? ?????? = ?????? and ?????? = ??????
??? ???? ???? orders as o
on r.user_id = o.user_id and r.product_id = o.product_id

