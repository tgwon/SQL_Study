DROP TABLE IF EXISTS mst_categories;
CREATE TABLE mst_categories(
    id       integer
  , name     varchar(255)
  , stamp 	 varchar(255)
);

INSERT INTO mst_categories
VALUES
     ('1', 'fashion', '2016-01-01 10:00:00')
   , ('2', 'fashion', '2016-02-01 10:00:00')
   , ('3', 'book', '2016-01-01 10:00:00')
   , ('2', 'game', '2016-02-01 10:00:00')
   , ('4', 'food', '2016-01-01 10:00:00')
   , ('5', 'drink', '2016-01-02 10:00:00')
   , ('6', 'cooking', '2016-01-01 10:00:00')
   , ('5', 'dvd', '2016-01-02 10:00:00')
;

SELECT 
	id
	, COUNT(*) AS record_num
	, ???????(name, ?) AS name_list
	, ???????(stamp,?) AS stamp_list
FROM 
	mst_categories
GROUP BY ??
HAVING ???  --중복된 ID 확인하기
;