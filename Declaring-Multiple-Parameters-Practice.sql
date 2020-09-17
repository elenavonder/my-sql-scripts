/*Create a list of students that have GPA scores at or above a minimum
value and at or below a maximum value (inclusive) and order them by the
GPA score in asc order.*/
declare @highgpa float = 3.0;
declare @lowgpa float = 2.0;
select *
from Student
where GPA between @lowgpa and @highgpa
order by GPA
/*Make sure to put the low number first
and the high number second, or it won't Declare*/