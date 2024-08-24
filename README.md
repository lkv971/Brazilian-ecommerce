# Brazil E-Commerce Analytics Repository

## Overview
This repository is dedicated to data analytics for a Brazilian e-commerce marketplace platform. It provides a comprehensive framework for analyzing various aspects of the e-commerce data, including orders, products, customers, payments, and reviews. The project utilizes SQL Server Management Studio (SSMS) for database management, Power BI for creating interactive reports and dashboards, and Microsoft Fabric (Synapse Data Engineering) for ELT pipeline management and lakehouse integration.

## Table of Contents
- [Repository Structure](#repository-structure)
- [Detailed Description](#detailed-description)
- [Database and Tools](#database-and-tools)
- [How to Use](#how-to-use)
  - [Set Up the Database](#set-up-the-database)
  - [Database Maintenance](#database-maintenance)
  - [ELT Pipeline and Transformation](#elt-pipeline-and-transformation)
  - [Data Analysis](#data-analysis)
  - [Visualizations](#visualizations)
  - [SQL Server Jobs](#sql-server-jobs)

## Repository Structure
The repository is organized into the following folders and files:

### SQL Scripts
- `create_db_tables.sql`: Script to create the initial database tables.
- `insert_data.sql`: Script to insert raw data into the tables.
- `alter_tables.sql`: Scripts for altering existing tables.
- `triggers.sql`: Triggers to automate database tasks.
- `views.sql`: SQL views for data aggregation and simplification.
- `functions.sql`: Custom functions for specific data operations.
- `procedures.sql`: Stored procedures for complex data processing.

### Raw Data
- `orders.csv`: Data related to customer orders.
- `order_items.csv`: Details of items in each order.
- `payments.csv`: Information about payment transactions.
- `products.csv`: Data about products available on the platform.
- `customers.csv`: Customer data including demographic details.
- `product_category.csv`: Categories associated with the products.
- `geolocation.csv`: Geolocation data for delivery addresses.
- `sellers.csv`: Information about sellers on the platform.
- `reviews.csv`: Customer reviews for the products.

### Power BI Reports and Dashboards
- `Brazil Commerce Analytics.pbix`: Power BI report file for comprehensive e-commerce data analysis.
- `Brazil Analytics.pdf`: A PDF version of the analytics report.
- `2017 Healthy Beauty Dashboard.png`: Screenshot of the 2017 Healthy Beauty Dashboard.

### Database
- `brazil_commerce_database.sql`: Complete SQL script to create and populate the Brazil commerce database.
- **Schema**
  - `Snowflake Schema Diagram.png`: Screenshot representing the snowflake schema used for organizing the data.

### SQL Server Jobs
- `daily_differential_backup_brazil_commerce.sql`: Script for performing daily differential backups.
- `weekly_full_backup_brazil_commerce.sql`: Script for performing weekly full backups.
- `daily_insert_multiple_tables_brazil_commerce.sql`: Script for daily data inserts into multiple tables.

### ELT Pipeline Diagrams
- `brazil_commerce_pipeline.png`: Screenshot of the ELT pipeline diagram that shows both the activities of copying data from SQL Server to a lakehouse in Microsoft Fabric (Synapse Data Engineering) and the subsequent data transformation.

### ELT Transformation Notebooks
- `transformation_brazil_commerce.ipynb`: Jupyter notebook containing Python code for data transformation processes related to the Brazil commerce data.

## Detailed Description
This repository provides a robust framework for analyzing the performance and operations of a Brazilian e-commerce marketplace. It includes:

- **Database Management**: SQL scripts for creating and maintaining the database structure, including tables, views, triggers, and stored procedures.
- **Data Ingestion**: Scripts to insert and manage raw data related to orders, products, and customer interactions.
- **Data Analysis**: Power BI reports that offer insights into sales, customer behavior, and product performance.
- **Visualization**: Dashboards that provide a visual summary of key performance indicators (KPIs) in the e-commerce platform.
- **ELT Pipeline**: A two-step ELT (Extract, Load, Transform) data pipeline that integrates data into a lakehouse in Microsoft Fabric (Synapse Data Engineering). The pipeline follows an ELT approach, as represented in the `brazil_commerce_pipeline.png` diagram:
  1. **Extract and Load**: Data from multiple tables is extracted from SQL Server and loaded into the lakehouse.
  2. **Transform**: Selected tables within the lakehouse are then transformed using a PySpark notebook (`transformation_brazil_commerce.ipynb`).

## Database and Tools

### Database
The database is designed using SQL Server, with scripts provided to create and populate the necessary tables and structures for e-commerce data analysis.

### Tools Used
- **SQL Server Management Studio (SSMS)**: Used for managing the SQL Server database, executing T-SQL scripts, and performing database maintenance tasks.
- **Power BI**: Utilized for creating interactive and visually appealing reports and dashboards, providing insights into e-commerce data.
- **Microsoft Fabric (Synapse Data Engineering)**: Used for managing data pipelines and integrating data into a lakehouse for further analysis.
- **Jupyter Notebooks**: Used for data transformation tasks in Python, supporting more complex data cleaning and manipulation.

## How to Use

### Set Up the Database
**Prerequisites:**
- SQL Server 2016 or higher.
- SQL Server Management Studio (SSMS) installed.
- Power BI Desktop installed.

**Instructions:**
1. Open the `brazil_commerce_database.sql` file in SQL Server Management Studio (SSMS).
2. Execute the script to create the database, tables, and insert the raw data.

### Database Maintenance
Utilize the scripts in the SQL Scripts folder to maintain and optimize the database. This includes altering tables, creating views, setting up triggers, defining functions, and executing stored procedures.

### ELT Pipeline and Transformation
1. Open the `brazil_commerce_pipeline.png` file to review the ELT pipeline. The diagram illustrates the following two ELT activities:
   - **Activity 1**: **Extract and Load** - Data from multiple tables is extracted from SQL Server and loaded into the lakehouse.
   - **Activity 2**: **Transform** - Selected tables are transformed within the lakehouse using the `transformation_brazil_commerce.ipynb` notebook, which contains PySpark code for data transformation.

### Data Analysis
1. Open the `Brazil Commerce Analytics.pbix` file in Power BI Desktop to explore the detailed analytics report.
2. Refer to the `Brazil Analytics.pdf` for a static, printable version of the report.

### Visualizations
Review the `2017 Healthy Beauty Dashboard.png` screenshot for a visual overview of the health and beauty category's performance in 2017.

### SQL Server Jobs
- **Daily Differential Backup**: Use the `daily_differential_backup_brazil_commerce.sql` script to perform daily differential backups of the database.
- **Weekly Full Backup**: Use the `weekly_full_backup_brazil_commerce.sql` script to perform weekly full backups of the database.
- **Daily Data Insert**: Use the `daily_insert_multiple_tables_brazil_commerce.sql` script to automate daily data inserts into multiple tables.
