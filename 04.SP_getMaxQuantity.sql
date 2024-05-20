use littlelemondb;
delimiter //
create procedure GetMaxQuantity() 
begin 
select MAX(quantity) as Max_quantity_order from orders; 
end //
delimiter ;