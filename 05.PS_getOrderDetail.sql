use littlelemondb;
PREPARE GetOrderDetail FROM 'SELECT order_id, quantity, total_cost FROM Orders WHERE customer_id = ?';