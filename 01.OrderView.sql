use LittleLemonDB;
create view OrdersView as 
select order_id, quantity, total_cost 
from orders  
where quantity > 2;