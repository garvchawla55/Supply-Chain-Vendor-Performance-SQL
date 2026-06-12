-- 1. Insert Data into Vendors
INSERT INTO Vendors (vendor_id, vendor_name, category_specialty, contract_start_date, sla_days) VALUES
(101, 'Alpha Electronics', 'Components', '2025-01-15', 5),
(102, 'Apex Logistics & Supply', 'Packaging', '2025-03-01', 3),
(103, 'Global Tex Industries', 'Apparel', '2024-11-10', 7),
(104, 'Delta Plastic Corp', 'Raw Materials', '2025-05-20', 4),
(105, 'Quantum Logistics', 'Packaging', '2025-06-01', 3),
(106, 'Zenith Textiles', 'Apparel', '2025-01-20', 6),
(107, 'Matrix Chemicals', 'Raw Materials', '2025-02-14', 5),
(108, 'Titan Tech Solutions', 'Components', '2025-07-19', 4),
(109, 'Pinnacle Paper Ltd', 'Packaging', '2024-09-05', 3),
(110, 'EcoWeave Fabrics', 'Apparel', '2025-03-11', 7),
(111, 'Nova Polymers', 'Raw Materials', '2025-08-22', 5),
(112, 'Apex Silicon Corp', 'Components', '2025-04-30', 6),
(113, 'SwiftBox Packaging', 'Packaging', '2025-10-02', 2),
(114, 'Vanguard Threads', 'Apparel', '2025-11-15', 5);

-- 2. Insert Data into Products
INSERT INTO Products (product_id, product_name, vendor_id, unit_price, stock_level) VALUES
(501, 'Microcontroller Chip', 101, 12.50, 1200),
(502, 'LED Display Panel', 101, 45.00, 5),     -- Low Stock Alert!
(503, 'Premium Cardboard Boxes', 102, 1.20, 5000),
(504, 'Cotton Crewneck T-Shirt', 103, 8.00, 350),
(505, 'Polymer Resin Beads', 104, 3.10, 8),      -- Low Stock Alert!
(506, 'Custom Shipping Mailers', 105, 0.85, 4500),
(507, 'Polyester Blend Yarn', 106, 4.50, 600),
(508, 'Industrial Catalyst Fluid', 107, 85.00, 15),
(509, '12V Power Adapters', 108, 15.20, 3),        -- Low Stock Alert!
(510, 'Recycled Cardboard Rolls', 109, 2.10, 800),
(511, 'Organic Denim Sheets', 110, 14.00, 120),
(512, 'High-Density Polyethylene', 111, 5.50, 4),   -- Low Stock Alert!
(513, 'Micro-Sensors (Type B)', 112, 22.00, 450),
(514, 'Corrugated Storage Bins', 113, 3.40, 1500),
(515, 'Waterproof Nylon Fabric', 114, 9.20, 210);

-- 3. Insert Data into Orders
INSERT INTO Orders (order_id, product_id, order_date, quantity_ordered, total_cost, order_status) VALUES
(1001, 501, '2026-05-01', 200, 2500.00, 'Completed'),
(1002, 502, '2026-05-03', 50, 2250.00, 'Completed'),
(1003, 503, '2026-05-10', 1000, 1200.00, 'Completed'),
(1004, 504, '2026-05-12', 150, 1200.00, 'Completed'),
(1005, 501, '2026-05-28', 100, 1250.00, 'Completed'),
(1006, 505, '2026-06-01', 300, 930.00, 'Pending'),
(1007, 506, '2026-05-02', 500, 425.00, 'Completed'),
(1008, 507, '2026-05-05', 100, 450.00, 'Completed'),
(1009, 508, '2026-05-07', 10, 850.00, 'Completed'),
(1010, 509, '2026-05-11', 40, 608.00, 'Completed'),
(1011, 510, '2026-05-14', 200, 420.00, 'Completed'),
(1012, 511, '2026-05-16', 50, 700.00, 'Completed'),
(1013, 512, '2026-05-19', 80, 440.00, 'Completed'),
(1014, 513, '2026-05-22', 150, 3300.00, 'Completed'),
(1015, 514, '2026-05-25', 300, 1020.00, 'Completed'),
(1016, 515, '2026-05-26', 70, 644.00, 'Completed');

-- 4. Insert Data into Shipments
-- Note: DATEDIFF calculates delivery speed. Some rows intentionally breach SLA days!
INSERT INTO Shipments (shipment_id, order_id, shipment_date, delivery_date, carrier_name, delivery_status) VALUES
(9001, 1001, '2026-05-02', '2026-05-05', 'BlueDart', 'On-Time'),   -- Took 4 days (SLA was 5)
(9002, 1002, '2026-05-04', '2026-05-11', 'DHL Express', 'Delayed'),-- Took 8 days (SLA was 5 - Delayed!)
(9003, 1003, '2026-05-11', '2026-05-15', 'FedEx', 'Delayed'),      -- Took 5 days (SLA was 3 - Delayed!)
(9004, 1004, '2026-05-14', '2026-05-19', 'BlueDart', 'On-Time'),   -- Took 7 days (SLA was 7)
(9005, 1005, '2026-05-29', '2026-06-02', 'FedEx', 'On-Time'),      -- Took 5 days (SLA was 5)
(9006, 1006, NULL, NULL, 'DHL Express', 'In-Transit'),
(9007, 1007, '2026-05-03', '2026-05-05', 'FedEx', 'On-Time'),     -- Took 3 days (SLA was 3)
(9008, 1008, '2026-05-06', '2026-05-14', 'DHL Express', 'Delayed'),-- Took 9 days (SLA was 6 - Delayed!)
(9009, 1009, '2026-05-08', '2026-05-12', 'BlueDart', 'On-Time'),   -- Took 5 days (SLA was 5)
(9010, 1010, '2026-05-12', '2026-05-18', 'FedEx', 'Delayed'),      -- Took 7 days (SLA was 4 - Delayed!)
(9011, 1011, '2026-05-15', '2026-05-17', 'UPS', 'On-Time'),        -- Took 3 days (SLA was 3)
(9012, 1012, '2026-05-17', '2026-05-26', 'DHL Express', 'Delayed'),-- Took 10 days (SLA was 7 - Delayed!)
(9013, 1013, '2026-05-20', '2026-05-23', 'BlueDart', 'On-Time'),   -- Took 4 days (SLA was 5)
(9014, 1014, '2026-05-23', '2026-05-31', 'UPS', 'Delayed'),        -- Took 9 days (SLA was 6 - Delayed!)
(9015, 1015, '2026-05-26', '2026-05-27', 'FedEx', 'On-Time'),     -- Took 2 days (SLA was 2)
(9016, 1016, '2026-05-27', '2026-06-03', 'BlueDart', 'Delayed');