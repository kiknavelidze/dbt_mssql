
SELECT TOP 1 1 AS BLN
FROM {{ source('raw', 'main') }}
WHERE bought_date > CAST(GETDATE() AS DATE)