Business problem statement
A telecom company wants to understand customer churn and identify customer segments that may require retention attention. This project analyzes customer demographic information, account tenure, contract type, billing and payment preferences, support services, and subscribed service features to identify patterns associated with churn. The goal is to provide a stakeholder-ready dashboard and evidence-based retention recommendations that can help business teams prioritize customer-retention actions.

Stakeholders
Executive leadership: monitors overall churn and customer-retention performance.
Customer retention / marketing team: designs targeted offers and outreach.
Customer support team: evaluates whether support-related services are associated with churn.
Product and service teams: assesses whether service features or bundles are linked with churn patterns.
Finance team: evaluates potential revenue exposure from churn.
Success metrics

We will calculate these later from the dataset:

Overall churn rate = churned customers ÷ total customers × 100
Total customers
Total churned customers
Churn rate by segment, such as contract type, tenure group, payment method, internet service, and support services
High-risk segment definition: a segment with a churn rate above the overall churn rate, with enough customers to be meaningful
Potential revenue-at-risk proxy: monthly charges associated with churned customers, clearly labeled as a proxy rather than actual lost lifetime revenue
Scope

Included: data-quality assessment and cleaning; descriptive churn analysis in Python and SQL; dashboard design in Power BI; findings grounded in calculated results; practical retention recommendations.

Excluded: predictive machine-learning modeling, causal claims, campaign experimentation, customer-level intervention decisions, and assumptions about profitability or lifetime value that are not available in the dataset.

Analysis questions

Answer these through SQL, Python, and Power BI later:

What is the overall churn rate and how many customers churned?
How does churn vary by tenure and tenure group?
How does churn differ by contract type?
How does churn differ by payment method and paperless billing?
Are support-related services—such as Tech Support, Online Security, and Device Protection—associated with different churn rates?
How does churn vary by internet service type and service features such as Streaming TV, Streaming Movies, and Online Backup?
How does churn vary across demographic attributes such as senior-citizen status, partner status, and dependents?
Which segments have both a high churn rate and a substantial customer count?
What monthly-charge exposure is associated with churned customers?
Which findings can be translated into realistic retention actions without overstating causation?



## My Project Decision
I will use the IBM Telco Customer Churn dataset because: it is widely used for analyst portfolios, has a clear business context, and supports Python cleaning, SQL analysis, and a stakeholder-ready Power BI dashboard

My primary stakeholder will be:My primary stakeholder will be the Customer Retention Manager, who needs to understand which customer groups show higher observed churn rates and where retention efforts should be prioritized.

The main business decision this analysis should support is:The main business decision this analysis should support is how the customer-retention team should prioritize customer segments, service-related interventions, and outreach efforts based on observed churn patterns.