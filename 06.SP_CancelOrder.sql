use littlelemondb;
delimiter //
create procedure CancelOrder (in orderid int)
begin
	delete from orders where order_id = orderid;
end //
delimiter ;