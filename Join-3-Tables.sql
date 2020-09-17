
select * from orders o
join orderlines l on o.id = l.ordersid
>>>>>>> e1c24f5835c6f818992d2a53d36d390e4a4d20e5
join customers c on c.id = o.CustomerId