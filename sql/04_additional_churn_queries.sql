DROP TABLE IF EXISTS telco_customer_churn;

CREATE TABLE telco_customer_churn (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    senior_citizen SMALLINT,
    partner VARCHAR(5),
    dependents VARCHAR(5),
    tenure INTEGER,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(25),
    internet_service VARCHAR(20),
    online_security VARCHAR(25),
    online_backup VARCHAR(25),
    device_protection VARCHAR(25),
    tech_support VARCHAR(25),
    streaming_tv VARCHAR(25),
    streaming_movies VARCHAR(25),
    contract_type VARCHAR(20),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),
    monthly_charges NUMERIC(10,2),
    total_charges NUMERIC(12,2),
    churn VARCHAR(5),
    senior_citizen_label VARCHAR(5),
    churn_flag SMALLINT,
    tenure_group VARCHAR(20)
);


DROP TABLE IF EXISTS telco_customer_churn_staging;

CREATE TABLE telco_customer_churn_staging (
    "customerID" VARCHAR(20),
    "gender" VARCHAR(10),
    "SeniorCitizen" SMALLINT,
    "Partner" VARCHAR(5),
    "Dependents" VARCHAR(5),
    "tenure" INTEGER,
    "PhoneService" VARCHAR(5),
    "MultipleLines" VARCHAR(25),
    "InternetService" VARCHAR(20),
    "OnlineSecurity" VARCHAR(25),
    "OnlineBackup" VARCHAR(25),
    "DeviceProtection" VARCHAR(25),
    "TechSupport" VARCHAR(25),
    "StreamingTV" VARCHAR(25),
    "StreamingMovies" VARCHAR(25),
    "Contract" VARCHAR(20),
    "PaperlessBilling" VARCHAR(5),
    "PaymentMethod" VARCHAR(50),
    "MonthlyCharges" NUMERIC(10,2),
    "TotalCharges" NUMERIC(12,2),
    "Churn" VARCHAR(5),
    "SeniorCitizenLabel" VARCHAR(5),
    "ChurnFlag" SMALLINT,
    "TenureGroup" VARCHAR(20)
);

INSERT INTO telco_customer_churn (
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents,
    tenure,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,
    contract_type,
    paperless_billing,
    payment_method,
    monthly_charges,
    total_charges,
    churn,
    senior_citizen_label,
    churn_flag,
    tenure_group
)
SELECT
    "customerID",
    "gender",
    "SeniorCitizen",
    "Partner",
    "Dependents",
    "tenure",
    "PhoneService",
    "MultipleLines",
    "InternetService",
    "OnlineSecurity",
    "OnlineBackup",
    "DeviceProtection",
    "TechSupport",
    "StreamingTV",
    "StreamingMovies",
    "Contract",
    "PaperlessBilling",
    "PaymentMethod",
    "MonthlyCharges",
    "TotalCharges",
    "Churn",
    "SeniorCitizenLabel",
    "ChurnFlag",
    "TenureGroup"
FROM telco_customer_churn_staging;


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


SELECT COUNT(*) AS total_rows
FROM telco_customer_churn;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(*) FILTER (WHERE total_charges IS NULL) AS missing_total_charges,
    COUNT(*) FILTER (WHERE churn_flag NOT IN (0, 1)) AS invalid_churn_flags
FROM telco_customer_churn;



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