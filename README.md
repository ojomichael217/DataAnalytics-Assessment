# SQL Assessment

This repository contains my responses to a SQL-based data analysis assessment designed to evaluate practical SQL skills, including data retrieval, aggregation, joins, subqueries, and reporting logic.

## 👇 Overview of Solutions

---

### ✅ Question 1: High-Value Customers with Multiple Products

**Objective:** Identify customers with at least one funded savings plan and one funded investment plan, sorted by total deposits.

**Approach:**
- Joined `users_customuser`, `savings_savingsaccount`, and `plans_plan` using `owner_id`.
- Applied filters:
  - `is_regular_savings = 1` for savings
  - `is_a_fund = 1` for investments
  - `confirmed_amount > 0` to ensure the plan is funded
- Grouped by customer, counted products, and summed deposits.
- Sorted by total deposit value (in naira).

**Efficiency:** Filtering and aggregations are scoped at join level to reduce intermediate rows early.

---

### ✅ Question 2: Transaction Frequency Analysis

**Objective:** Categorize customers based on their average monthly transaction count.

**Approach:**
- Aggregated total transactions per customer.
- Divided by the number of distinct months active to compute monthly average.
- Applied `CASE` logic to classify customers into:
  - High Frequency (≥10/month)
  - Medium Frequency (3–9/month)
  - Low Frequency (≤2/month)

**Efficiency:** Used `DATE_TRUNC` to normalize by month and grouped only necessary fields.

---

### ✅ Question 3: Account Inactivity Alert

**Objective:** Flag all active plans/accounts with no inflow activity in the past 365 days.

**Approach:**
- Used `MAX(transaction_date)` to identify the last inflow.
- Compared this against `CURRENT_DATE - 365`.
- Filtered to accounts marked active with no recent inflow.

**Efficiency:** Used `MAX()` aggregation on indexed timestamp fields to reduce scan size.

---

### ✅ Question 4: Customer Lifetime Value (CLV) Estimation

**Objective:** Estimate each customer's CLV based on transaction history and account tenure.

**Approach:**
- Tenure calculated as months between signup and current date.
- Total transactions and transaction value summed.
- Applied the formula:
