--select * from customers;
--select * from orders;
select * from customers c
join orders o on c.id = o.CustomerId

