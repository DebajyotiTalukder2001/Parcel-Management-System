
--CREATE TABLE customers (
--				    customerID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  
--				    customerName VARCHAR(100) NOT NULL,
--				    email VARCHAR(100) NOT NULL UNIQUE,                    
--				    countryCode VARCHAR(10),
--				    mobileNumber VARCHAR(20),
--				    address VARCHAR(255),
--				    userID VARCHAR(50) NOT NULL UNIQUE,                      
--				    password VARCHAR(255) NOT NULL,                           
--				    preferences VARCHAR(255)                                         
--				);
--
--
--      
--CREATE TABLE officers (
--				    officerID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  
--					    officerName VARCHAR(100) NOT NULL,
--					    email VARCHAR(100) NOT NULL UNIQUE,                    
--				    countryCode VARCHAR(10),
--				    mobileNumber VARCHAR(20),
--				    address VARCHAR(255),
--				    userID VARCHAR(50) NOT NULL UNIQUE,                      
--				    password VARCHAR(255) NOT NULL                                         
--					);
--				
--					
--
--CREATE TABLE tbl_BookingData ( 
-- 
--    Booking_ID INT GENERATED ALWAYS AS IDENTITY (START WITH 1000000000, INCREMENT BY 1) PRIMARY KEY, 
--    User_Name VARCHAR(20) NOT NULL, 
--    Rec_Name VARCHAR(50),
--    Rec_Address VARCHAR(255), 
--    Rec_Pin VARCHAR(20),
--    Rec_Mobile VARCHAR(20),
--    Par_Size VARCHAR(20),
--    Par_Weight_Gram VARCHAR(20),
--    Par_Content_Description VARCHAR(255),
--    Par_Delivery_Type VARCHAR(50),
--    Par_Picking_Preference VARCHAR(20),
--    Par_Pickup_Time VARCHAR(50),
--    Par_Dropof_Time VARCHAR(50),
--    Par_Service_COST VARCHAR(20),
--    Par_PaymentTime VARCHAR(50),
--    Par_Status VARCHAR(10)
--     
--    );
    
    

				
--INSERT INTO officers (officerName, email, countryCode, MobileNumber, address, userID, Password) VALUES
--    ('Officer1', 'OF1@gmail.com', '+91', '1025489750', 'Mumbai, India', 'of111', 'Of111@');
    


select * from officers;

select * from CUSTOMERS;

select * from tbl_BookingData;

--drop table tbl_BookingData
--drop table CUSTOMERS;
--drop table officers;


















