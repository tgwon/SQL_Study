DROP TABLE IF EXISTS purchase_log_with_coupon;
CREATE TABLE purchase_log_with_coupon (
    purchase_id varchar(255)
  , amount      integer
  , coupon      integer
);

INSERT INTO purchase_log_with_coupon
VALUES
    ('10001', 3280, NULL)
  , ('10002', 4650,  500)
  , ('10003', 3870, NULL)
;

select * from purchase_log_with_coupon;
select
	purchase_id,
	amount,
	coupon,
	amount - coupon as discount_amount1,
	amount - coalesce(coupon,0) as discount_amount2
from
	purchase_log_with_coupon;