DROP TABLE IF EXISTS advertising_stats;
CREATE TABLE advertising_stats (
    dt          varchar(255)
  , ad_id       varchar(255)
  , impressions integer
  , clicks      integer
);

INSERT INTO advertising_stats
VALUES
    ('2017-04-01', '001', 100000,  3000)
  , ('2017-04-01', '002', 120000,  1200)
  , ('2017-04-01', '003', 500000, 10000)
  , ('2017-04-02', '001',      0,     0)
  , ('2017-04-02', '002', 130000,  1400)
  , ('2017-04-02', '003', 620000, 15000)
;

select * from advertising_stats;

select 
	dt,
	ad_id,
	case
	when impressions > 0 then round(100.0 * clicks/impressions,2)
	end as ctr1,
	100.0 * clicks/nullif(impressions, 0) as ctr2
from
	advertising_stats
order by
	dt, ad_id;
	
	
	
	
	
	
	