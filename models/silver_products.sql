{{ config(materialized='incremental') }}

SELECT
    internal_id AS product_id,
    name,
    brand,
    category,
    price,
    currency,
    stock,
    availability
FROM {{ source('bronze','products_bronze') }}

WHERE stock > 0

{% if is_incremental() %}

AND internal_id >
(
    SELECT max(product_id)
    FROM {{ this }}
)

{% endif %}