INSERT Student 
(id, Firstname, Lastname, SAT, GPA, MajorId)
VALUES
(501, 'Joe', 'Smith', 1450, 3.75,
	(select id from major 
	where description = 'Math'));