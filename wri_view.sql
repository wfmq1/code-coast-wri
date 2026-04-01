CREATE VIEW mart.wri_final AS
WITH base AS (
    SELECT
        e.region,
        e.excellence_rate + 0.3*e.merit_rate - 0.4*e.no_endorse_rate AS edu_score,
        j.job_amount,
        p.median_house_price,
        pop.pop_growth_rate
    FROM mart.education e
    JOIN mart.employment j ON e.region = j.region
    JOIN mart.property p ON e.region = p.region
    JOIN mart.population pop ON e.region = pop.region
),
zscores AS (
    SELECT
        region,
        (LN(job_amount) - AVG(LN(job_amount)) OVER()) / STDDEV(LN(job_amount)) OVER() AS job_z,
        -((median_house_price - AVG(median_house_price) OVER()) / STDDEV(median_house_price) OVER()) AS afford_z,
        (edu_score - AVG(edu_score) OVER()) / STDDEV(edu_score) OVER() AS edu_z,
        (pop_growth_rate - AVG(pop_growth_rate) OVER()) / STDDEV(pop_growth_rate) OVER() AS growth_z
    FROM base
),
wri AS (
    SELECT
        region,
        job_z,
        afford_z,
        edu_z,
        growth_z,
        (0.40*job_z + 0.30*afford_z + 0.20*edu_z + 0.10*growth_z) AS raw_score
    FROM zscores
)
SELECT
    region,
    job_z,
    afford_z,
    edu_z,
    growth_z,
    raw_score
FROM wri;