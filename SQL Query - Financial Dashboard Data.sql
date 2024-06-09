-- SQL Query to create and import data from csv files:

-- 0. Creating a database 
CREATE DATABASE ccdb;

-- 1. Creating cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);


-- 2. Creating cc_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. Copying csv data into SQL (remembering to update the file name and file location in below query)

-- copying cc_detail table

COPY cc_detail
FROM 'D:\credit_card.csv' 
DELIMITER ',' 
CSV HEADER;


-- copying cust_detail table

COPY cust_detail
FROM 'D:\customer.csv' 
DELIMITER ',' 
CSV HEADER;



-- If we get below error, then we use the below point:  
   -- ERROR:  date/time field value out of range: "0"
   -- HINT:  Perhaps we need a different "datestyle" setting.

-- Checking the Data in our CSV File: Ensuring date column values are formatted correctly and are in a valid format that PostgreSQL can recognize (e.g., YYYY-MM-DD). And correcting any incorrect or missing date values in the CSV file. 
   -- or
-- Updating the Datestyle Setting: Seting the datestyle explicitly for our session using the following command:
SET datestyle TO 'ISO, DMY';

-- Now, trying to COPY the csv files!


-- 4. Inserting additional data into SQL, using same COPY function

-- copying additional data (week-53) in cc_detail table

COPY cc_detail
FROM 'D:\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;


-- copying additional data (week-53) in cust_detail table (remembering to update the file name and file location in below query)

COPY cust_detail
FROM 'D:\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;

