DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    date_time              varchar(255)
  , order_num        integer
  , user_name         varchar(255)
  , amount_purchase integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',    1, 'rhwpvvitou', 13900)
  , ('2014-02-08',   95, 'chtanrqtzj', 28469)
  , ('2014-03-09',  168, 'bcqgtwxdgq', 18899)
  , ('2014-04-11',  250, 'kdjyplrxtk', 12394)
  , ('2014-05-11',  325, 'pgnjnnapsc',  2282)
  , ('2014-06-12',  400, 'iztgctnnlh', 10180)
  , ('2014-07-11',  475, 'eucjmxvjkj',  4027)
  , ('2014-08-10',  550, 'fqwvlvndef',  6243)
  , ('2014-09-10',  625, 'mhwhxfxrxq',  3832)
  , ('2014-10-11',  700, 'wyrgiyvaia',  6716)
  , ('2014-11-10',  775, 'cwpdvmhhwh', 16444)
  , ('2014-12-10',  850, 'eqeaqvixkf', 29199)
  , ('2015-01-09',  925, 'efmclayfnr', 22111)
  , ('2015-02-10', 1000, 'qnebafrkco', 11965)
  , ('2015-03-12', 1075, 'gsvqniykgx', 20215)
  , ('2015-04-12', 1150, 'ayzvjvnocm', 11792)
  , ('2015-05-13', 1225, 'knhevkibbp', 18087)
  , ('2015-06-10', 1291, 'wxhxmzqxuw', 18859)
  , ('2015-07-10', 1366, 'krrcpumtzb', 14919)
  , ('2015-08-08', 1441, 'lpglkecvsl', 12906)
  , ('2015-09-07', 1516, 'mgtlsfgfbj',  5696)
  , ('2015-10-07', 1591, 'trgjscaajt', 13398)
  , ('2015-11-06', 1666, 'ccfbjyeqrb',  6213)
  , ('2015-12-05', 1741, 'onooskbtzp', 26024)
  , ('2016-01-05', 1852, 'skdfalskdf', 22211)
  , ('2016-02-19', 1900, 'qwiejfvdff', 12323)
  , ('2016-03-22', 1995, 'askdfalkvv', 21321)
  , ('2016-04-20', 2001, 'wnfaskdvld', 11232)
  , ('2016-05-11', 2021, 'vnalksdnas', 18121)
  , ('2016-06-03', 2099, 'zmflsasdff', 19422)
  , ('2016-07-09', 2156, 'qwerwqttyy', 15321)
  , ('2016-08-11', 2191, 'zxcmertttj', 11325)
  , ('2016-09-20', 2274, 'poijklmlnm',  5542)
  , ('2016-10-11', 2300, 'tgafgdhfhh', 14655)
  , ('2016-11-11', 2356, 'csaqqweaaa',  7987)
  , ('2016-12-25', 2444, 'mnvksfoaoo', 12312)
;

WITH 
daily_purchase AS ( 
	SELECT date_time
    , ### as year
    , ### as month
    , ### as date
    , ### as amount_purchase --날짜별 매출값
    , ### as orders -- 주문이 몇 개인지 세주는 함수
    FROM purchase_log
    GROUP BY ###
)
, monthly_purchase AS (
SELECT
	year
	, month
	, ### AS amount -- 월차 매출
FROM daily_purchase
GROUP BY ###
)
, calc_index AS (
SELECT
	year
	, month
	, amount
	, SUM(CASE WHEN year = ### THEN ### END)
		OVER(ORDER BY year, ###) -- rows를 이용해서 이전값들을 전부 가져오는 명령어
	AS agg_amount -- 2016년의 누계 매출 집계
	, SUM(###)
		OVER(ORDER BY year, month ROWS BETWEEN ###) -- 당월부터 11개월 이전까지의 매출임을 지정하는 명령어
    AS year_avg_amount 
FROM monthly_purchase
ORDER BY year, month
) 

SELECT
	concat(###) AS year_mon -- 2016년의 데이터 압축
    , amount
	, agg_amount
	, year_avg_amount
FROM calc_index
WHERE year = ###
ORDER BY ###