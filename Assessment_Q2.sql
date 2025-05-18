-- Transaction Frequency Analysis
-- Categorize customers based on average monthly transactions

WITH monthly_tx AS (
    SELECT 
        owner_id,
        DATE_TRUNC('month', transaction_date) AS tx_month,
        COUNT(*) AS tx_count
    FROM savings_savingsaccount
    GROUP BY owner_id, tx_month
),
avg_tx_per_user AS (
    SELECT 
        owner_id,
        AVG(tx_count) AS avg_tx_per_month
    FROM monthly_tx
    GROUP BY owner_id
),
categorized AS (
    SELECT 
        CASE 
            WHEN avg_tx_per_month >= 10 THEN 'High Frequency'
            WHEN avg_tx_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_tx_per_month
    FROM avg_tx_per_user
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_tx_per_month), 1) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category;
