# Data Cleaning Log

## Source
- Raw file: `data/raw/telco_customer_churn_raw.csv`
- Raw dataset shape: 7,043 rows and 21 columns

## Cleaning steps
1. Preserved the raw dataset without modification.
2. Removed leading and trailing whitespace from text columns.
3. Converted `TotalCharges` from text to numeric.
4. Identified 11 blank `TotalCharges` values.
5. Verified all 11 blank `TotalCharges` records had `tenure = 0`.
6. Replaced those 11 missing `TotalCharges` values with `0.0`.
7. Added `SeniorCitizenLabel` with values `Yes` and `No`.
8. Added `ChurnFlag` where `Yes = 1` and `No = 0`.
9. Added `TenureGroup` for lifecycle-based churn analysis.
10. Confirmed no duplicate rows, duplicate customer IDs, missing values, or negative total charges remained.

## Output
- Cleaned file: `data/cleaned/telco_customer_churn_cleaned.csv`
- Cleaned dataset shape: 7,043 rows and 24 columns
