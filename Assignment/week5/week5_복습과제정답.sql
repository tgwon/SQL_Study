-- https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all

-- 위 링크 타고 들어가서 쿼리( ex. SELECT * FROM Customers limit 5)를 통해 데이터베이스 안에 있는 테이블들부터 파악해보시고 아래 문제를 해결해주세요
-- 사실 customers, orders, orderdetails 이거 3개만 사용합니다
-- with 문 사용 X, 하나의 쿼리만을 이용해서 해결하세요


-- Q1
-- country 별로 contactname이 ‘A’로 시작하는 customer의 숫자를 세는 쿼리를 작성하세요. 
-- 단, country 이름을 기준으로 내림차순 정렬하세요. 

-- Q1 정답
select
Country
,count(*) as count
from Customers
where ContactName like 'A%'
group by Country
order by Country desc;


-- Q2
-- customer 별로 order한 product의 총 quantity를 세는 쿼리를 작성하세요.
-- 단, 총 quantity를 기준으로 오름차순 7개만 정렬하세요. 

-- Q2 정답
select
a.CustomerID
,sum(b.Quantity) as sum
from
Orders a
join
OrderDetails b
on a.OrderId = b.OrderId
group by a.CustomerID
order by sum
limit 7;


-- Q3
-- 년월 별, employee 별로 총 quantity를 표시하는 쿼리를 작성하세요.
-- substr 함수로 ym 컬럼 해결하세요

-- Q3 정답
select
substr(a.OrderDate,1,7) ym
,a.EmployeeID
,sum(b.Quantity) sumOfQuantity
from
Orders a
join
OrderDetails b
on a.OrderID = b.OrderID
group by
ym
,a.EmployeeID;


-- Q4
-- 동일한 주문 건에서 주문 수량이 가장 많은 주문 데이터(주문 ID, 상품  ID, 주문 수량)를 추출하는 쿼리를 작성하세요. 
-- 단, quantity를 기준으로 오름차순, quantity가 같다면 orderid를 기준으로 내림차순 정렬하세요.
-- (Hint : in 함수) 

-- Q4 정답
select OrderID, ProductID, Quantity
from OrderDetails
where (OrderID, Quantity) in (select OrderID, max(Quantity)
from OrderDetails
group by OrderID)
order by quantity, orderid desc;


-- Q5
-- 주문 이력이 없는 고객의 고객 ID와 고객의 이름을 추출하는 쿼리를 작성하세요.  
-- 단, 고객이름의 길이가 가장 긴 3명만 추출하세요. 
-- (Hint : length 함수)

-- Q5 정답
select CustomerID, CustomerName
from Customers
where CustomerID not in (select CustomerID from Orders)
order by length(customername) desc
limit 3;