USE MASTER;
go

DROP DATABASE IF EXISTS BcDb;
go

CREATE DATABASE BcDb;
go

USE BcDb;
go

CREATE TABLE Customers(
[Id] [int] NOT NULL PRIMARY KEY IDENTITY (1,1),
[Code] [varchar](10) NOT NULL UNIQUE,
[Name] [varchar](30) NOT NULL,
[Sales] [decimal](9,2) NOT NULL DEFAULT 0 CHECK (sales >= 0),
[Active] [bit] NOT NULL DEFAULT 1,
[Created] datetime not null default GETDATE(),
);
INSERT Customers (Code, Name, Sales) VALUES
('A', 'Home Depot', 5000),
('B', 'Lowes', 1000),
('C', 'ACE Hardware',3000),
('D', 'McGabes',2000);

INSERT Customers (Code, Name) VALUES
('E', 'Tractor Supply Company');

CREATE TABLE Orders (
[Id] [int] NOT NULL PRIMARY KEY IDENTITY (1,1),
[Description] [varchar](30) NOT NULL,
[Total] [decimal](9,2) NOT NULL DEFAULT 0,
[CustomersId] [int] NOT NULL FOREIGN KEY REFERENCES Customers(Id),
);

INSERT Orders (Description, CustomerId, Total) VALUES
('Lumber', '1', 10000),
('Electric', '2', 40000),
('Gardening', '3', 70000),
('Paint', '4', 50000);