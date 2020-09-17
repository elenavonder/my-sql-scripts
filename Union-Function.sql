/*Create a list of students caegorising each student
according to their SAT scores: A if >1200;
B if between 1200 and 1000; C if < 1000*/
select Lastname, SAT, 'A' as 'ABC'
	from Student
	where sat > 1200
union
select Lastname, SAT, 'B' as 'ABC'
	from Student
	where sat <= 1200 and sat > 1000
union
select Lastname, SAT, 'C' as 'ABC'
	from Student
	where sat <1000;