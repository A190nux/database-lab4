SELECT customer_name FROM customer WHERE customer_name LIKE 'Ma%';

SELECT o.order_id, SUM(oi.quantity), sum(i.unit_price*oi.quantity)  FROM
order AS o JOIN order_item as oi on o.order_id = oi.order_id JOIN item as i on i.item_id = oi.item_id
WHERE i.item_id = oi.item_id group by o.order_id;

SELECT o.order_id FROM
order AS o JOIN shipment as sh on o.order_id = sh.order_id JOIN warehouse as wr on wr.warehouse_id = sh.warehouse_id
WHERE wr.warehouse_city = 'Arica';

SELECT sum(i.unit_price*oi.quantity)  FROM
shipment AS sh JOIN order_item as oi on sh.order_id = oi.order_id JOIN item as i on i.item_id = oi.item_id
WHERE i.item_id = oi.item_id AND sh.warehouse_id = 8;

SELECT wr.warehouse_id , wr.warehouse_city, COUNT(sh.order_id) FROM warehouse as wr LEFT JOIN shipment AS sh
on wr.warehouse_id = sh.warehouse_id GROUP BY wr.warehouse_id;

SELECT c.customer_name, COUNT(oi.order_id) FROM customer as c LEFT JOIN order as oi on c.customer_id = oi.customer_id GROUP by oi.customer_id;

SELECT i.item_id FROM item as i WHERE i.item_id NOT IN (SELECT item_id FROM order_item);