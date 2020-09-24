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
('RGreen', 'Fashion', 'Rachel', 'Green', '513-555-1111', 'RGreen@friends.com', 0, 0),
('MGeller', 'Chef', 'Monica', 'Geller', '513-555-2222', 'MGeller@friends.com', 1, 1),
('PBuffay', 'SmellyCat', 'Phoebe', 'Buffay', '513-555-3333', 'PBuffay@friends.com', 0, 0),
('CBing', 'Sarcasm', 'Chandler', 'Bing', '513-555-4444', 'CBing@friends.com', 1, 0),
('RGeller', 'Dino', 'Ross', 'Geller', '513-555-5555', 'RGeller@friends.com', 0, 0),
('JTribbiani', 'Sandwich', 'Joey', 'Tribbiani', '513-555-6666', 'JTribbiani@friends.com', 0, 0);

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
('BARN', 'Pottery Barn', '7875 Montgomery Rd', 'Cincinnati', 'OH', '45236', '513-794-0705', 'User@potterybarn.com'),
('CRBA', 'Crate & Barrel', '3965 Townsfair Way', 'Columbus', 'OH', '43219', '614-475-7428', 'User@cratebarrel.com'),
('IKEA', 'IKEA', '1900 Ikea Way', 'Columbus', 'OH', '43240', '888-888-4532', 'user@ikea.com');

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
(3, 'BOOK', 'Bookcase', '70.00'),
(1, 'COUCH', 'Love Seat', '2000.00'),
(3, 'FRIDGE', 'Refrigerator', '300.00'),
(2, 'BEDDING', 'Pillow Top Queen Mattress', '200.00'),
(1, 'TABLES', 'Apothecary Table', '60.00'),
(2, 'TV', '50 in Television', '250.00'),
(2, 'RECLINE', 'Recliner', '80.00'),
(2, 'BABY', 'Changing Table', '55.00');

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
(1, '1st Request', 'Saw In Catelog', 'UPS'),
(2, '1st Request', 'Having Twins', 'UPS'),
(5, '1st Request', 'Pivot', 'Pick Up'),
(6, '1st Request', 'Broken', 'Pick Up');

Create Table LineItems(
Id int NOT NULL PRIMARY KEY IDENTITY (1,1),
RequestsId int NOT NULL FOREIGN KEY REFERENCES Requests(Id),
ProductsId int NOT NULL FOREIGN KEY REFERENCES Products(Id),
Quantity int NOT NULL DEFAULT 1,
);

INSERT LineItems (RequestsId, ProductsId) VALUES
(1, 5),
(2, 8),
(3, 2),
(4, 3);