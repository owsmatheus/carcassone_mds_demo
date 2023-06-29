{{ config(materialized='table') }}

SELECT
    user_id,
    CAST(replace(subscription_price, '$', '') AS Float) subscription_price
FROM {{ source('mongodb', 'payments') }}