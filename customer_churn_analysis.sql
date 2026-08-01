CREATE DATABASE customer_churn_db;

USE customer_churn_db;

SELECT *
FROM customer_churn
LIMIT 10;

SELECT COUNT(*) AS total_customers
FROM customer_churn;

SELECT COUNT(*) AS churn_customers
FROM customer_churn
WHERE Churn = 'Yes';

SELECT COUNT(*) AS active_customers
FROM customer_churn
WHERE Churn = 'No';

SELECT
    ROUND(
        COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn;

SELECT
    gender,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churn_customers
FROM customer_churn
GROUP BY gender;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churn_customers
FROM customer_churn
GROUP BY Contract
ORDER BY churn_customers DESC;

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM customer_churn
GROUP BY Churn;

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-1 Year'
        WHEN tenure <= 24 THEN '1-2 Years'
        WHEN tenure <= 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS customers,
    COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS churn_customers
FROM customer_churn
GROUP BY tenure_group
ORDER BY customers DESC;
