SELECT 
    p.product_name,
    p.stock_level,
    p.unit_price,
    v.vendor_name AS supplier_name
FROM Products p
JOIN Vendors v ON p.vendor_id = v.vendor_id
WHERE p.stock_level < 10
ORDER BY p.stock_level ASC;