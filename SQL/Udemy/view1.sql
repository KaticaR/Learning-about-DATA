CREATE VIEW customer_info AS
SELECT first_name, last_name, email, address, phone
FROM customer AS c
JOIN address AS a
ON c.address_id = a.address_id;