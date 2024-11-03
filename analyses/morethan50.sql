
;WITH CustPerYear AS
(
SELECT customer_id
		,YEAR(bought_date) AS BroughtYear
		,SUM(amount) AS TotalAmount
FROM {{ source('raw', 'main')}}
GROUP BY customer_id
		,YEAR(bought_date)
)
,Percs AS
(
SELECT *
		,TotalAmount / SUM(TotalAmount) OVER (PARTITION BY customer_id) * 100 AS PercentFromAllY
FROM CustPerYear
)
SELECT * 
FROM Percs
WHERE PercentFromAllY > 50