-- Account Inactivity Alert
-- Find active accounts with no inflow for over 365 days

WITH last_tx_dates AS (
    SELECT 
        id AS plan_id,
        owner_id,
        'Investment' AS type,
        MAX(transaction_date) AS last_transaction_date
    FROM plans_plan
    WHERE is_a_fund = 1 AND confirmed_amount > 0
    GROUP BY id, owner_id

    UNION

    SELECT 
        id AS plan_id,
        owner_id,
        'Savings' AS type,
        MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    WHERE is_regular_savings = 1 AND confirmed_amount > 0
    GROUP BY id, owner_id
)
SELECT 
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATE_PART('day', CURRENT_DATE - last_transaction_date) AS inactivity_days
FROM last_tx_dates
WHERE last_transaction_date < CURRENT_DATE - INTERVAL '365 days'
ORDER BY inactivity_days DESC;
