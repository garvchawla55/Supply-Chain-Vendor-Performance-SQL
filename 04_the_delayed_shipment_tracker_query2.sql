SELECT 
    s.shipment_id,
    o.order_id,
    v.vendor_name,
    s.carrier_name,
    o.order_date,
    s.delivery_date
FROM Shipments s
JOIN Orders o ON s.order_id = o.order_id
JOIN Products p ON o.product_id = p.product_id
JOIN Vendors v ON p.vendor_id = v.vendor_id
WHERE s.delivery_status = 'Delayed'
ORDER BY o.order_date ASC;