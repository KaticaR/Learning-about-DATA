/* Returns namas and id's of the films that are returned between 2005-05-29 and 2005-05-30 */


SELECT film_id, title
FROM film 
WHERE film_id IN (  SELECT film_id
				 	FROM rental AS r
				  	INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id
				  	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30' );