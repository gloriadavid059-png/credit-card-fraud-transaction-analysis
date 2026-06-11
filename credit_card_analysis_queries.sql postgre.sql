SELECT ROUND(SUM(amount), 2) AS total_transaction_value
FROM transactions;


SELECT COUNT(*) AS total_transactions
FROM transactions;

SELECT ROUND(AVG(amount), 2) AS average_transaction_amount
FROM transactions;


SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraud_transactions,
    ROUND(
        100.0 * SUM(CASE WHEN fraud_flag = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS fraud_rate_percent
FROM transactions;


SELECT
    merchant_category,
    COUNT(*) AS fraud_count
FROM transactions
WHERE fraud_flag = TRUE
GROUP BY merchant_category
ORDER BY fraud_count DESC;


SELECT
    user_id,
    ROUND(SUM(amount),2) AS total_spent
FROM transactions
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;


SELECT
    u.country,
    ROUND(SUM(t.amount),2) AS total_spent
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id
GROUP BY u.country
ORDER BY total_spent DESC;


SELECT
    c.card_type,
    COUNT(*) AS transaction_count
FROM transactions t
JOIN cards c
    ON t.card_id = c.card_id
GROUP BY c.card_type
ORDER BY transaction_count DESC;


SELECT
    DATE_TRUNC('month', transaction_time) AS month,
    ROUND(SUM(amount),2) AS total_spend
FROM transactions
GROUP BY DATE_TRUNC('month', transaction_time)
ORDER BY month;


SELECT
    u.country,
    COUNT(*) AS fraud_count
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id
WHERE t.fraud_flag = TRUE
GROUP BY u.country
ORDER BY fraud_count DESC;


SELECT COUNT(*) FROM transactions;