/*
=============================================================
Database and Schema Initialization Script
=============================================================
Purpose:
    This script initializes a SQL Data Warehouse environment by creating a database
    named 'SQLDataWarehouse'. If the database already exists, it will be dropped
    and recreated to ensure a clean setup.

    After the database is created, the script defines three schemas to support
    a layered data architecture:
        - bronze : Raw source data
        - silver : Cleaned and transformed data
        - gold   : Business-ready, aggregated data

IMPORTANT NOTICE:
    Executing this script will permanently delete the existing
    'SQLDataWarehouse' database (if present), including all tables,
    data, and objects within it.

    Use this script ONLY in development or controlled environments.
    Always verify backups before execution.
=============================================================
*/

USE master

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'SQLDataWarehouse')
BEGIN
    ALTER DATABASE SQLDataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE SQLDataWarehouse;
END;
GO
-- Create the 'DataWarehouse' database
CREATE DATABASE SQLDataWarehouse

USE SQLDataWarehouse


CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO

