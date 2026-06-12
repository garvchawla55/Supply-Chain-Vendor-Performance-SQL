# Supply-Chain-Vendor-Performance-SQL
A MySQL-based inbound procurement and supply chain analytics database optimized to evaluate vendor SLAs and track inventory logs

## Project Overview
This project implements a relational database system designed for an inbound procurement model. It allows a retail business to monitor supplier contract parameters, evaluate carrier shipping reliability, and generate proactive inventory restocking alerts based on historical transaction logs.

The database is built and tested using MySQL Workbench and is structured in Third Normal Form (3NF) to ensure data integrity and zero redundancy.

---

##  Database Architecture & Schema
The system consists of 4 normalized tables mapped together via Primary and Foreign Key constraints:

* Vendors: Tracks supplier profile data and contract Service Level Agreements (SLA days).
* Products: Houses the inventory catalog and live warehouse stock levels.
* Orders: Documents company purchase transactions and calculated total costs.
* Shipments: Monitors physical courier tracking, delivery statuses, and fulfillment speed.

---

##  Core Business Solutions Explained

### 1. Vendor Performance Leaderboard
* Objective: Ranks suppliers by total financial spending and tracks their historical delivery speed.
* Key SQL Concepts: Multi-table Inner Joins, `SUM()`, `AVG()`, `GROUP BY`, and `DATEDIFF()`.

### 2. Delayed Shipments Tracker
* Objective: Generates an active, prioritized queue of late deliveries for operational troubleshooting.
* Key SQL Concepts: Conditional filtering (`WHERE delivery_status = 'Delayed'`), chronological sorting.

### 3. Inventory Low-Stock Alert
* Objective: Triggers early warning indicators for items dropping below safety limits (stock < 10) paired with supplier maps.
* Key SQL Concepts: Aggregate evaluations, relational mapping.

-
1. Execute the scripts inside `schema.sql` to build the database architecture.
2. Run the scripts in `insert_data.sql` to populate the environment with sample enterprise logs.
3. Use the queries in `queries.sql` to generate analytical business reports.
