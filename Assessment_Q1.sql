-- High-Value Customers with Multiple Products
-- Find customers with at least one funded savings and one funded investment plan

SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON u.id = p.owner_id
WHERE s.is_regular_savings = 1
  AND s.confirmed_amount > 0
  AND p.is_a_fund = 1
  AND p.confirmed_amount > 0
GROUP BY u.id, u.name
ORDER BY total_deposits DESC;
