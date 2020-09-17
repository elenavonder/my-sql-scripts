/*A school gives a $1,250 scholarship to the brightest students but 
only $5000 is available. What is the SAT score (1125, 1240, 1375...)
about which all qualified students can recieve a scholarship?*/

Declare @MaxSAT int;
set @MaxSAT = 1100;
Select *
	from Student
	where SAT > @MaxSAT
	order by SAT desc
	
/*has to be in the same script: define variable, define what type
of data (varchar, int, datetime); then set what the value is*/