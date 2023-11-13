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
	),
	lead_time AS (
		SELECT 
			r.user_id, r.product_id,
            -- 날짜의 차이
			e.estimate_date::date - r.request_date::date as estimate_lead_time,
			o.order_date::date - e.estimate_date::date as order_lead_time,
			o.order_date::date - r.request_date::date as total_lead_time
		FROM request AS r
		????????? estimates AS e ON r.user_id = e.user_id AND r.product_id = e.product_id
		????????? orders AS o ON r.user_id = o.user_id AND r.product_id = o.product_id
	),
	user_counts AS (
		SELECT total_lead_time, COUNT(user_id) AS users
		FROM lead_time
		GROUP BY total_lead_time
	),
	composition_ratio AS (
		SELECT 
			total_lead_time,
			users,
			100.0 * ???? / SUM(????) OVER () AS composition_ratio,
			100.0 * SUM(????) OVER (ORDER BY ??? DESC ROWS BETWEEN ??? ???? AND ???? ????) / SUM(???) OVER () AS cumulative_ratio
		FROM user_counts
	)
	SELECT *
	FROM composition_ratio
	ORDER BY users DESC;
