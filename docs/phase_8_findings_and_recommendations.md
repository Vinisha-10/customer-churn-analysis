# Customer Churn Analysis: Findings and Retention Recommendations

## 1. Executive Summary

The analysis covers 7,043 telecom customers. A total of 1,869 customers churned, resulting in an overall churn rate of 26.54%. The monthly charge exposure associated with churned customers was $139,130.85.

The strongest observed churn patterns were associated with month-to-month contracts, early tenure, electronic check payments, fiber optic internet service, and customers without both tech support and online security.

---

## 2. Key Findings

### Finding 1: Month-to-month customers had the highest churn rate

Month-to-month customers had a churn rate of 42.71%, compared with 11.27% for one-year contracts and 2.83% for two-year contracts.

This indicates that customers without a longer-term commitment represent a major retention opportunity.

### Finding 2: New customers were the highest-risk tenure segment

Customers with 1–12 months of tenure had a churn rate of 47.68%. Churn declined as tenure increased:

| Tenure Group | Churn Rate |
|---|---:|
| 1–12 months | 47.68% |
| 13–24 months | 28.71% |
| 25–48 months | 20.39% |
| 49–72 months | 9.51% |

This pattern suggests that the first year of the customer lifecycle is the most important period for retention activity.

### Finding 3: Electronic check customers had the highest churn rate

Customers using electronic check had a churn rate of 45.29%, compared with:

| Payment Method | Churn Rate |
|---|---:|
| Electronic check | 45.29% |
| Mailed check | 19.11% |
| Bank transfer (automatic) | 16.71% |
| Credit card (automatic) | 15.24% |

Electronic check customers should be investigated as a priority segment for payment-experience and autopay conversion initiatives.

### Finding 4: Fiber optic customers had elevated churn

Fiber optic customers had a churn rate of 41.89%, compared with 18.96% for DSL customers and 7.40% for customers without internet service.

This indicates that the fiber optic customer experience, pricing, service expectations, or customer mix should be investigated further.

### Finding 5: Customers without both tech support and online security had the highest service-related churn

Customers with no tech support and no online security had a churn rate of 48.96%.

In comparison, customers with both tech support and online security had a churn rate of 9.01%.

This is one of the strongest observed retention patterns in the dataset.

### Finding 6: Senior customers without partners were a high-risk demographic segment

Senior customers without partners had a churn rate of 49.20%, the highest observed demographic combination in the analysis.

This segment should be considered for proactive outreach and simplified support journeys.

### Finding 7: Churned customers had higher average monthly charges

The dashboard shows that churned customers had a higher average monthly charge than retained customers.

This indicates that price sensitivity or perceived value may be relevant areas for further investigation, although the dataset does not establish causation.

---

## 3. High-Risk Customer Segments

The highest-priority retention segments identified from the analysis are:

1. Month-to-month customers
2. Customers with 1–12 months of tenure
3. Electronic check customers
4. Fiber optic customers
5. Customers without both tech support and online security
6. Senior customers without partners

These segments should be prioritized using a combined risk approach rather than treating each attribute independently.

---

## 4. Retention Recommendations

### Recommendation 1: Create an early-life customer retention program

Target customers in their first 12 months with onboarding emails, service-setup guidance, usage tips, and proactive check-ins.

The objective should be to reduce the high observed churn rate of 47.68% among customers with 1–12 months of tenure.

### Recommendation 2: Encourage month-to-month customers to move to longer contracts

Offer targeted incentives such as limited-time discounts, service upgrades, or loyalty benefits for customers who switch from month-to-month to one-year or two-year contracts.

This recommendation is supported by the large difference between month-to-month churn of 42.71% and two-year churn of 2.83%.

### Recommendation 3: Promote automatic payment methods

Offer a simple migration journey from electronic check to bank transfer or credit card autopay. Potential incentives could include billing reminders, one-time credits, or small loyalty benefits.

This should be tested because electronic check customers had the highest observed payment-method churn rate of 45.29%.

### Recommendation 4: Bundle tech support and online security for high-risk customers

Create targeted bundles for customers without tech support and online security, especially for fiber optic and early-tenure customers.

The strongest service-related pattern was a 48.96% churn rate among customers with neither service, compared with 9.01% among customers with both.

### Recommendation 5: Investigate the fiber optic customer experience

Conduct follow-up analysis using customer complaints, service quality, pricing, network reliability, and customer satisfaction data if available.

Fiber optic customers had a churn rate of 41.89%, but this dataset alone cannot identify the root cause.

### Recommendation 6: Provide proactive support for senior customers without partners

Offer simplified support channels, onboarding assistance, and proactive service check-ins for senior customers without partners.

This segment had a churn rate of 49.20%, making it a suitable candidate for targeted retention testing.

---

## 5. Limitations

- The dataset is a historical customer dataset and may not represent current business conditions.
- The analysis identifies associations, not causal relationships.
- The dataset does not include customer satisfaction, complaint history, service outage data, competitor information, marketing campaign history, or reasons for churn.
- Monthly charge exposure is not the same as customer lifetime value or revenue lost over time.
- Small segments should be interpreted carefully because high churn rates may be based on fewer customers.

---

## 6. Next Steps

1. Build a customer-level churn risk score using the identified high-risk attributes.
2. Combine churn data with customer satisfaction, support-ticket, complaint, and network-quality data.
3. Run A/B tests for contract incentives, autopay conversion, and support/security bundles.
4. Track retention campaign outcomes using churn reduction, conversion rate, and retained monthly revenue.
5. Refresh the dashboard regularly with current customer data.

## 7. Analyst Note

The recommendations above are based on observed churn patterns in the IBM Telco Customer Churn dataset. They should be validated through controlled retention experiments before being implemented at scale.