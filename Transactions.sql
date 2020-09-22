--Select * from Users

BEGIN TRANSACTION;

INSERT Users (Username, Password, FirstName, LastName, PhoneNumber, Email)
VALUES ('PBuffay', 'SmellyCat', 'Phoebe', 'Buffay', '513-555-3242', 'PBuffay@gmail.com');

--ROLLBACK TRANSACTION; --Will Reverse INSERT

COMMIT TRANSACTION; --Will keep INSERT

Select * from Users;