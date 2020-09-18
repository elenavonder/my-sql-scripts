/*Update ID (Joe Smith) to Joseph Smith*/
UPDATE Student SET
	Firstname = 'Joseph'
	Where Id in (500, 501);

select * from Student
order by Id desc;
