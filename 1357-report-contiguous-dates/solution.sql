WITH all_dates AS (
    SELECT fail_date AS date, 'failed' AS period_state
    FROM Failed
    WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'

    UNION ALL

    SELECT success_date AS date, 'succeeded' AS period_state
    FROM Succeeded
    WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31'
),

grouped AS (
    SELECT
        date,
        period_state,
        DATE_SUB(
            date,
            INTERVAL ROW_NUMBER() OVER (
                PARTITION BY period_state
                ORDER BY date
            ) DAY
        ) AS grp
    FROM all_dates
)

SELECT
    period_state,
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM grouped
GROUP BY period_state, grp
ORDER BY start_date;
