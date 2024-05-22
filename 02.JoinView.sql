use littlelemondb;
CREATE VIEW over_fifteen_hundred AS
SELECT c.customer_id, c.customer_name, o.order_id, o.total_cost, m.item_name, mt.item_type
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
INNER JOIN menu AS m ON o.menu_item_id = m.menu_item_id
INNER JOIN menutypes AS mt ON m.item_type_id = mt.item_type_id
WHERE o.total_cost > 150;