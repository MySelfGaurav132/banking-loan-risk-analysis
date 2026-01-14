-- Loan Risk Classification Query
SELECT l.loan_id, c.full_name,
       SUM(CASE WHEN r.paid_date IS NULL THEN 1 ELSE 0 END) AS missed_count,
       CASE
           WHEN SUM(CASE WHEN r.paid_date IS NULL THEN 1 ELSE 0 END) >= 2 THEN 'HIGH'
           WHEN SUM(CASE WHEN r.paid_date IS NULL THEN 1 ELSE 0 END) = 1 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS risk_level
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
LEFT JOIN repayments r ON l.loan_id = r.loan_id
GROUP BY l.loan_id, c.full_name;


