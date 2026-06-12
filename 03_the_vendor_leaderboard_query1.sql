SELECT 
    v.vendor_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_cost) AS total_amount_spent,
    AVG(DATEDIFF(s.delivery_date, o.order_date)) AS avg_days_to_deliver
FROM Vendors v
JOIN Products p ON v.vendor_id = p.vendor_id
JOIN Orders o ON p.product_id = o.product_id
JOIN Shipments s ON o.order_id = s.order_id
WHERE o.order_status = 'Completed'
GROUP BY v.vendor_name
ORDER BY total_amount_spent DESC;