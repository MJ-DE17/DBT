{{config ( materialized = 'table')}}

SELECT
    sp.category,
    pc.department,
    COUNT(*) AS total_products,
    AVG(sp.price) AS avg_price
FROM {{ ref('silver_products') }} sp
LEFT JOIN {{ ref('product_category_lookup') }} pc
ON sp.category = pc.category
GROUP BY sp.category, pc.department