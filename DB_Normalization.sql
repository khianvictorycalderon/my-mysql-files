    
    /*
    
     First normal form normalization:
     - Define the data items required, because they become the columns in a table. Place related data items in a table.
     - Ensure that there are no repeating groups of data.
     - Ensure that there is a primary key.
    
    */
    
    CREATE TABLE CUSTOMERS(
     ID INT NOT NULL,
     NAME VARCHAR (20) NOT NULL,
     AGE INT NOT NULL,
     ADDRESS CHAR (25),
     PRIMARY KEY (ID)
    );
    
    CREATE TABLE ORDERS(
     ID INT NOT NULL,
     CUSTOMER_ID INT NOT NULL,
     ORDERS VARCHAR(155),
     PRIMARY KEY (ID)
    );
    
    /*
    
     Second Normal Form:
     Second normal form states that it should meet all the rules for 1NF and there must be no partial dependences of any of the columns on the primary key:
     - Consider a customer-order relation and you want to store customer ID, customer name, order ID and order detail, and date of purchase:
    
     To make this table comply with second normal form, you need to separate the columns into three tables
    */
    
    CREATE TABLE CUSTOMERS(
     CUST_ID INT NOT NULL,
     CUST_NAME VARCHAR (20) NOT NULL,
     PRIMARY KEY (CUST_ID)
    );
    
    CREATE TABLE ORDERS(
     ORDER_ID INT NOT NULL,
     ORDER_DETAIL VARCHAR (20) NOT NULL,
     PRIMARY KEY (ORDER_ID)
    );
    
    CREATE TABLE CUSTMERORDERS(
     CUST_ID INT NOT NULL,
     ORDER_ID INT NOT NULL,
     SALE_DATE DATETIME,
     PRIMARY KEY (CUST_ID, ORDER_ID)
    );
    
    /*
    
     Third Normal Form:
     A table is in third normal form when the following conditions are met:
     - It is in second normal form.
     - All nonprimary fields are dependent on the primary key.
    
    */
    
    CREATE TABLE ADDRESS(
     ZIP VARCHAR(12),
     STREET VARCHAR(200),
     CITY VARCHAR(100),
     STATE VARCHAR(100),
     PRIMARY KEY (ZIP)
    );
    
    CREATE TABLE CUSTOMERS(
     CUST_ID INT NOT NULL,
     CUST_NAME VARCHAR (20) NOT NULL,
     DOB DATE,
     ZIP VARCHAR(12),
     EMAIL_ID VARCHAR(256),
     PRIMARY KEY (CUST_ID)
    );
    
    /*
     tips:
     - Avoid data duplication
     - Always use primary key
     - Create relationships
     - Depend only on primary key not non-key attributes and composite keys
     - Group related data into separate table
     - Ensure each field contains only one piece of information
    */