/*Declaring multiple values in one query*/
declare @lowsat int = 1000;
declare @highsat int = 1200;
select *
	from Student
	where SAT >= @lowsat and SAT <= @highsat;