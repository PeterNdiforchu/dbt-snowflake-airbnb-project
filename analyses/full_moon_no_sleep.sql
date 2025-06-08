WITH fullmoon_reviews AS (
 SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT
 is_fullmoon,
 reviewn_sentiment,
COUNT(*) as reviews
FROM fullmoon_reviews
GROUP BY is_fullmoon, reviewn_sentiment
ORDER BY is_fullmoon, reviewn_sentiment
