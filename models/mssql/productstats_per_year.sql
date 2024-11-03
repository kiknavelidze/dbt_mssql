SELECT YEAR(m.bought_date) AS Years
		,p.[name] AS ProductName
		,COUNT(DISTINCT m.customer_id) AS Users
		,COUNT(DISTINCT m.transaction_id) AS Transactions
		,SUM(m.qty) AS Quantity
		,SUM(m.amount) AS Amount
FROM {{ source('raw', 'main') }} m
LEFT JOIN {{ source('raw', 'products') }} p ON p.product_id = m.product_id
GROUP BY YEAR(m.bought_date)
		,p.[name]