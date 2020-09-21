USE MASTER;

DROP DATABASE IF EXISTS BcDb;

CREATE DATABASE BcDb;

USE BcDb;

CREATE TABLE Customers(
[Id] [int] NOT NULL PRIMARY KEY IDENTITY (1,1),
[Code] [varchar](10) NOT NULL UNIQUE,
[Name] [varchar](30) NOT NULL,
[Sales] [decimal](9,2) NOT NULL DEFAULT 0 CHECK (sales >= 0),
[Active] [bit] NOT NULL DEFAULT 1,
[Created] datetime not null default GETDATE(),
);
INSERT Customers (Code, Name, Sales) VALUES
('A', 'Courtney', 5000),
('B', 'Morgan', 1000),
('C', 'Andrew',3000),
('D', 'Cameron',2000);

INSERT Customers (Code, Name) VALUES
('E', 'Tommy');