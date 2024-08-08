# Brazil E-Commerce Analytics Repository

## Overview
This repository is dedicated to the data analytics of a Brazilian e-commerce marketplace platform. It provides a comprehensive framework for analyzing various aspects of the e-commerce data, including orders, products, customers, payments, and reviews. The project leverages SQL Server Management Studio (SSMS) for database management and Power BI for creating interactive reports and dashboards.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Detailed Description](#detailed-description)
- [Database and Tools](#database-and-tools)
- [How to Use](#how-to-use)
  - [Set Up the Database](#set-up-the-database)
  - [Database Maintenance](#database-maintenance)
  - [Data Analysis](#data-analysis)
  - [Visualizations](#visualizations)
  - [SQL Server Jobs](#sql-server-jobs)

## Repository Structure
The repository is organized into the following folders and files:

1. **SQL Scripts**
   - `create_db_tables.sql`: Script to create the initial database tables.
   - `insert_data.sql`: Script to insert raw data into the tables.
   - `alter_tables.sql`: Scripts for altering existing tables.
   - `triggers.sql`: Triggers to automate database tasks.
   - `views.sql`: SQL views for data aggregation and simplification.
   - `functions.sql`: Custom functions for specific data operations.
   - `procedures.sql`: Stored procedures for complex data processing.

2. **Raw Data**
   - `orders.csv`: Data related to customer orders.
   - `order_items.csv`: Details of items in each order.
   - `payments.csv`: Information about payment transactions.
   - `products.csv`: Data about products available on the platform.
   - `customers.csv`: Customer data including demographic details.
   - `product_category.csv`: Categories associated with the products.
   - `geolocation.csv`: Geolocation data for delivery addresses.
   - `sellers.csv`: Information about sellers on the platform.
   - `reviews.csv`: Customer reviews for the products.

3. **Power BI Reports and Dashboards**
   - `Brazil Commerce Analytics.pbix`: Power BI report file for comprehensive e-commerce data analysis.
   - `Brazil Analytics.pdf`: A PDF version of the analytics report.
   - `2017 Healthy Beauty Dashboard.png`: Screenshot of the 2017 Healthy Beauty Dashboard.

4. **Database**
   - `brazil_commerce_database.sql`: Complete SQL script to create and populate the Brazil commerce database.

5. **Schema**
   - `Snowflake Schema Diagram.png`: Screenshot representing the snowflake schema used for organizing the data.

## Detailed Description
This repository provides a robust framework for analyzing the performance and operations of a Brazilian e-commerce marketplace. It includes:

- **Database Management**: SQL scripts for creating and maintaining the database structure, including tables, views, triggers, and stored procedures.
- **Data Ingestion**: Scripts to insert and manage raw data related to orders, products, and customer interactions.
- **Data Analysis**: Power BI reports that offer insights into sales, customer behavior, and product performance.
- **Visualization**: Dashboards that provide a visual summary of key performance indicators (KPIs) in the e-commerce platform.

## Database and Tools
### Database
The database is designed using SQL Server, with scripts provided to create and populate the necessary tables and structures for e-commerce data analysis.

### Tools Used
- **SQL Server Management Studio (SSMS)**: Used for managing the SQL Server database, executing T-SQL scripts, and performing database maintenance tasks.
- **Power BI**: Utilized for creating interactive and visually appealing reports and dashboards, providing insights into e-commerce data.

## How to Use
### Set Up the Database
#### Prerequisites:
- SQL Server 2016 or higher.
- SQL Server Management Studio (SSMS) installed.
- Power BI Desktop installed.

#### Instructions:
1. Open the `brazil_commerce_database.sql` file in SQL Server Management Studio (SSMS).
2. Execute the script to create the database, tables, and insert the raw data.

### Database Maintenance
- Utilize the scripts in the `SQL Scripts` folder to maintain and optimize the database. This includes altering tables, creating views, setting up triggers, defining functions, and executing stored procedures.

### Data Analysis
- Open the `Brazil Commerce Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
- Refer to the `Brazil Analytics.pdf` for a static, printable version of the report.

### Visualizations
- Review the `2017 Healthy Beauty Dashboard.png` screenshot for a visual overview of the health and beauty category's performance in 2017.

### SQL Server Jobs
- Daily Differential Backup: The daily_differential_backup_brazil_commerce.sql script is used to create a differential backup of the database every day. This ensures that all changes since the last full backup are captured.
-Weekly Full Backup: The weekly_full_backup_brazil_commerce.sql script creates a full backup of the database once a week, preserving the entire state of the database.
-Daily Data Insert: The daily_insert_multiple_tables_brazil_commerce.sql script automates the insertion of data into multiple tables on a daily basis, keeping the database up-to-date for analysis.