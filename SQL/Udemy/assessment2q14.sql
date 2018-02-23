/*  How can you produce a list of the start times for bookings for tennis courts,
	for the date '2012-09-21'? 
    Return a list of start time and facility name pairings, ordered by the time.*/


SELECT b.starttime, f.name
FROM cd.bookings AS b
JOIN cd.facilities AS f ON b.facid = f.facid
WHERE starttime > '2012-09-21' 
	 AND f.name LIKE '%Tennis Court%'
ORDER BY b.starttime;