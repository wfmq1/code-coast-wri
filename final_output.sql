SELECT
    region,
    ROUND(raw_score::NUMERIC, 4) AS wri_score
FROM mart.wri_final
ORDER BY raw_score DESC;