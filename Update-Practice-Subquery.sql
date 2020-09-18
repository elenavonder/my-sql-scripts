/*Update students major with subquery*/
Update Student SET
	MajorId = (select Id from Major  
	where description = 'accounting')
 Where Id = 110;

 Select * from student
 Where Id = 110;