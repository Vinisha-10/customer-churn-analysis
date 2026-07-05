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
