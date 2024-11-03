
{{ config(schema='staging') }} --რატო არ ქმნის ამ სქემით ვერ გავიგე და რატო ქმნის dm_staging-ით...

SELECT EOMONTH(m.bought_date) AS Monthz
		,c.channel_name AS Channel
		,COUNT(DISTINCT m.customer_id) AS Users
		,COUNT(DISTINCT m.transaction_id) AS Transactions
		,COUNT(DISTINCT m.product_id) AS Products
		,SUM(m.qty) AS Quantity
		,SUM(m.amount) AS Amount
FROM {{ source('raw', 'main') }} m
LEFT JOIN {{ source('raw', 'channels') }} c ON c.channel_id = m.channel_id
GROUP BY EOMONTH(m.bought_date)
		,c.channel_name