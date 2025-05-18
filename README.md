# DataAnalytics-Assessment

This repository contains SQL solutions for a Data Analyst Assessment. The queries are designed to solve real-world business problems using customer, savings, and investment data.

## 🔍 Questions & Approaches

### Q1: High-Value Customers with Multiple Products
**Goal:** Identify customers with both a funded savings plan and a funded investment plan.  
**Approach:** Used `JOIN` and conditional filtering to count and aggregate deposits, sorted by total inflow.

### Q2: Transaction Frequency Analysis
**Goal:** Segment customers based on average monthly transactions.  
**Approach:** Aggregated transactions by customer/month, calculated averages, and classified into frequency categories using a CTE chain.

### Q3: Account Inactivity Alert
**Goal:** Flag accounts with no deposits in the past 365 days.  
**Approach:** Used `MAX(transaction_date)` and filtered for older dates using `CURRENT_DATE - INTERVAL`.

### Q4: Customer Lifetime Value (CLV)
**Goal:** Estimate CLV based on tenure and transactions.  
**Approach:** Combined total transaction value with tenure to compute a simplified CLV formula.

## 🧠 Challenges Faced
- Ensuring data fields like `confirmed_amount` were normalized (amounts in kobo).
- Distinguishing between savings and investment plans accurately using flags.
- Handling division-by-zero in tenure calculation gracefully.

## 💡 Notes
- All monetary values were divided by 100 to convert kobo to Naira.
- Assumed `transaction_date` exists in savings/investment tables (adjust if named differently).
