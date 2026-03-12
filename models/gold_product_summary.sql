{{config ( materialized = 'table')}}

SELECT
    category,
    COUNT(*) as total_products,
    AVG(price) as avg_price
FROM {{ ref('silver_products') }}
GROUP BY category