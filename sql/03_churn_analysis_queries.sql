SELECT
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent,
    ROUND(SUM(CASE WHEN churn_flag = 1 THEN monthly_charges ELSE 0 END), 2)
        AS churned_monthly_charge_exposure
FROM telco_customer_churn;

SELECT
    contract_type,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY contract_type
ORDER BY churn_rate_percent DESC;

SELECT
    tenure_group,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0 months' THEN 1
        WHEN '1-12 months' THEN 2
        WHEN '13-24 months' THEN 3
        WHEN '25-48 months' THEN 4
        WHEN '49-72 months' THEN 5
    END;

    SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY payment_method
ORDER BY churn_rate_percent DESC;

SELECT
    tech_support,
    online_security,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY tech_support, online_security
ORDER BY churn_rate_percent DESC;

SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY internet_service
ORDER BY churn_rate_percent DESC;

SELECT
    senior_citizen_label,
    partner,
    dependents,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate_percent
FROM telco_customer_churn
GROUP BY senior_citizen_label, partner, dependents
ORDER BY churn_rate_percent DESC;

WITH overall_churn AS (
    SELECT 100.0 * SUM(churn_flag) / COUNT(*) AS overall_churn_rate
    FROM telco_customer_churn
),
segment_churn AS (
    SELECT
        contract_type,
        internet_service,
        payment_method,
        COUNT(*) AS total_customers,
        SUM(churn_flag) AS churned_customers,
        100.0 * SUM(churn_flag) / COUNT(*) AS churn_rate_percent
    FROM telco_customer_churn
    GROUP BY
        contract_type,
        internet_service,
        payment_method
)
SELECT
    contract_type,
    internet_service,
    payment_method,
    total_customers,
    churned_customers,
    ROUND(churn_rate_percent, 2) AS churn_rate_percent
FROM segment_churn
CROSS JOIN overall_churn
WHERE total_customers >= 100
  AND churn_rate_percent > overall_churn_rate
ORDER BY churn_rate_percent DESC, total_customers DESC;

