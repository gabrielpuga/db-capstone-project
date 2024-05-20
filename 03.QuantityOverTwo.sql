use littlelemondb;
SELECT item_name
FROM Menu 
WHERE menu_item_id = ANY (
    SELECT menu_item_id
    FROM Orders 
    WHERE quantity > 2
);