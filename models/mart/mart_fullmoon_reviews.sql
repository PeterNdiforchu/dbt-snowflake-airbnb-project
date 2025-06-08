{{
    config(
        materialized='table'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
fullmoon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT
    r.*,
    CASE
        WHEN fm.full_moon_date IS NOT NULL THEN 'not full moon'
        ELSE 'full moon'
    END AS is_fullmoon
FROM fct_reviews r
LEFT JOIN fullmoon_dates fm
ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))