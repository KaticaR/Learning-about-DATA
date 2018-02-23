/*  How can you produce a list of the start times 
	for bookings by members named 'David Farrell'? */


SELECT b.starttime, m.surname, m.firstname
FROM cd.bookings AS b
JOIN cd.members AS m ON b.memid = m.memid
	WHERE m.surname LIKE 'Farrell'
	AND m.firstname LIKE 'David';
    