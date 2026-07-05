SELECT COUNT(*) AS total_rows
FROM telco_customer_churn;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(*) FILTER (WHERE total_charges IS NULL) AS missing_total_charges,
    COUNT(*) FILTER (WHERE churn_flag NOT IN (0, 1)) AS invalid_churn_flags
FROM telco_customer_churn;

SELECT
    churn,
    churn_flag,
    COUNT(*) AS customer_count
FROM telco_customer_churn
GROUP BY churn, churn_flag
ORDER BY churn_flag;