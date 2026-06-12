use company;
-- 1. Create Vendors Table
CREATE TABLE Vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    category_specialty VARCHAR(50),
    contract_start_date DATE,
    sla_days INT -- Promised days to fulfill an order
);

-- 2. Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    vendor_id INT,
    unit_price DECIMAL(10, 2),
    stock_level INT,
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
);

-- 3. Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date DATE NOT NULL,
    quantity_ordered INT NOT NULL,
    total_cost DECIMAL(12, 2),
    order_status VARCHAR(20), -- 'Completed', 'Pending', 'Cancelled'
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 4. Create Shipments Table
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE,
    delivery_date DATE, -- Actual date received at warehouse
    carrier_name VARCHAR(50),
    delivery_status VARCHAR(20), -- 'On-Time', 'Delayed', 'In-Transit'
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);