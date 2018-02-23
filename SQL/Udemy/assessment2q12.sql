/*  Produce a list of the total number of slots booked 
	per facility in the month of September 2012. 
    Produce an output table consisting of facility id and slots, 
    sorted by the number of slots.*/


SELECT facid, SUM(slots) AS number_of_slots
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid
ORDER BY number_of_slots;