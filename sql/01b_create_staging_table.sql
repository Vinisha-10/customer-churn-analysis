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


