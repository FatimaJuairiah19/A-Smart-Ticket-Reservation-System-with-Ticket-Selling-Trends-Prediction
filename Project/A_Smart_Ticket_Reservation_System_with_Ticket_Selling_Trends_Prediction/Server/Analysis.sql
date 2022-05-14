
--drop table SellingMonth cascade constraint;

set serveroutput on;
set verify off;

DECLARE
BEGIN
	dbms_output.put_line('Ranking of the Buses'); 
	
End;
/
--dbms_output.put_line('Ranking of the Buses'); 
SELECT bname ,AVG (rating_score) FROM RATING@site1 GROUP BY bname ORDER BY AVG(rating_score) DESC;

--SELECT fromto ,count  (rid) FROM Route GROUP BY rid DESC;



DECLARE
BEGIN
	dbms_output.put_line('Top Ticket Selling Routes'); 
	
End;
/
--dbms_output.put_line('Top Ticket Selling Routes'); 
SELECT COUNT(rid), rid from transactions@site1 
     GROUP BY rid ORDER  BY count(*) DESC;
	 

DECLARE
BEGIN
	dbms_output.put_line('Profit Analysis for specific Bus'); 
	
End;
/

SELECT bid,
REGR_SLOPE(rid, amount) slope,
REGR_INTERCEPT(rid, amount) intercept
   FROM transactions
   GROUP BY bid
   ORDER BY bid;  
   
/*   
SELECT sid,
REGR_SLOPE(rid, amount) slope,
REGR_INTERCEPT(rid, amount) intercept
   FROM transactions
   GROUP BY sid
   ORDER BY sid;   
*/

DECLARE
BEGIN
	dbms_output.put_line('Month and Amount Analysis'); 
	
End;
/
SELECT months,
REGR_SLOPE(rid, amount) slope,
REGR_INTERCEPT(rid, amount) intercept
   FROM SellingMonth@site1
   GROUP BY months
   ORDER BY months;   



DECLARE
BEGIN
	dbms_output.put_line('Month and Ticket Selling Analysis'); 
	
End;
/
SELECT months,
REGR_SLOPE(rid, noOfTickets) slope,
REGR_INTERCEPT(rid, noOfTickets) intercept
   FROM SellingMonth@site1
   --WHERE rid =1
   GROUP BY months
   ORDER BY months;    
   
   

   