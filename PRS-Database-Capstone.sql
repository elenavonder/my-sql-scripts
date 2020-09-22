USE MASTER;
GO

DROP DATABASE IF EXISTS PRS;
GO

CREATE DATABASE PRS;
GO

USE PRS;
GO

Create Table Users(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
UserName varchar(20) NOT NULL UNIQUE,
Password varchar(10) NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
PhoneNumber varchar(12) NOT NULL,
Email varchar(75) NOT NULL,
IsReviewer bit NOT NULL DEFAULT 0,
IsAdmin bit NOT NULL DEFAULT 0,
);

INSERT Users (UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES
('RGreen', 'Fashion90', 'Rachel', 'Green', '513-555-0123', 'RGreen@gmail.com', 0, 0),
('MGeller', 'Chef19', 'Monica', 'Geller', '513-555-1234', 'MGeller@gmail.com', 0, 1),
('CBing', 'Sarcasm31', 'Chandler', 'Bing', '513-555-3456', 'CBing@gmail.com', 1, 0);

Create Table Vendors(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
Code varchar(10) NOT NULL UNIQUE,
Name varchar(255) NOT NULL,
Address varchar(255) NOT NULL,
City varchar(255) NOT NULL,
State varchar(2) NOT NULL,
Zip varchar(5) NOT NULL,
PhoneNumber varchar(12) NOT NULL,
Email varchar(100) NOT NULL,
);

INSERT Vendors (Code, Name, Address, City, State, Zip, PhoneNumber, Email) VALUES
('AMAZ', 'Amazon', '6150 Glenway Ave.', 'Cincinnati', 'OH', '45211', '513-719-1076', 'User@Amazon.com'),
('BBUY', 'Best Buy', '7400 Brookpark Rd.', 'Cleveland', 'OH', '44129', '216-351-9911', 'User@BBuy.com');

Create Table Products(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
VendorsId int NOT NULL FOREIGN KEY REFERENCES Vendors(Id),
PartNumber varchar(50) NOT NULL UNIQUE,
Name varchar(150) NOT NULL,
Price decimal(10,2) NOT NULL,
Unit varchar(255) NULL, --How many are there per package
PhotoPath varchar(255) NULL --Graphic Image 
);

INSERT Products (VendorsId, PartNumber, Name, Price) VALUES
(1, '999', 'Echo', '199.99'),
(1, '888', 'Apple Watch', '99.99'),
(2, '777', 'Xbox One', '299.99'),
(2, '666', 'Google Home', '199.99');

Create Table Requests(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
UsersId int NOT NULL FOREIGN KEY REFERENCES Users(Id),
Description varchar (100) NOT NULL,
Justification varchar (255) NOT NULL,
DateNeeded datetime NOT NULL DEFAULT GETDATE(),
DeliveryMode varchar(25) NOT NULL, --How they are recieving it
Status varchar(20) NOT NULL DEFAULT 'NEW', --Can see but can't change
Total Decimal (10,2) NOT NULL DEFAULT 0,
SubmittedDate datetime NOT NULL DEFAULT GETDATE(),
ReasonForRejection varchar (100) NULL,
);

INSERT Requests (UsersId, Description, Justification, DeliveryMode) VALUES
(1, '1st Request', 'For Work', 'UPS'),
(2, '1st Request', 'For Home', 'UPS'),
(3, '1st Request', 'For Work', 'Pick Up'),
(1, '2nd Request', 'Just Because', 'Pick Up'),
(3, '2nd Request', 'Just Because', 'UPS');

Create Table LineItems(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
RequestsId int NOT NULL FOREIGN KEY REFERENCES Requests(Id),
ProductsId int NOT NULL FOREIGN KEY REFERENCES Products(Id),
Quantity int NOT NULL DEFAULT 1,
);

INSERT LineItems (RequestsId, ProductsId) VALUES
(1, 2),
(2, 4),
(3, 3),
(4, 1),
(5, 2);