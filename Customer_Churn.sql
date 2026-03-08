SELECT COUNT(*) AS total_customers
FROM churn_data;

SELECT Churn, COUNT(*) AS total
FROM churn_data
GROUP BY Churn;

-- Churn Rate
SELECT 
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS churn_rate
FROM churn_data;

-- Churn by Contract Type
SELECT Contract, COUNT(*) AS customers
FROM churn_data
WHERE Churn='Yes'
GROUP BY Contract
ORDER BY customers DESC;

-- Churn by Payment Method
SELECT PaymentMethod, COUNT(*) AS churn_customers
FROM churn_data
WHERE Churn='Yes'
GROUP BY PaymentMethod
ORDER BY churn_customers DESC;

-- Tenure vs Churn
SELECT 
    CASE
        WHEN tenure < 12 THEN '0-1 Year'
        WHEN tenure BETWEEN 12 AND 36 THEN '1-3 Years'
        ELSE '3+ Years'
    END AS tenure_group,
    COUNT(*) AS churn_customers
FROM churn_data
WHERE Churn='Yes'
GROUP BY tenure_group;

