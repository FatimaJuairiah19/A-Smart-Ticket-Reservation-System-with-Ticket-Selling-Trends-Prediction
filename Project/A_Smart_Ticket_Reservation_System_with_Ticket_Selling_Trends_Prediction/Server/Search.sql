set serveroutput on;
set verify off;


CREATE OR REPLACE PACKAGE searchAvail AS
	
	PROCEDURE isAvailSeat(p_busname in bus.bname%type);
END searchAvail;
/

CREATE OR REPLACE PACKAGE BODY searchAvail AS

	PROCEDURE isAvailSeat(p_busname in bus.bname%type)
	IS

	p_bid bus.bid%type ;
	p_seat_price bus.price%type;
	p_seat_avail bus.avail%type ;
	BEGIN
		select bid,price, avail into p_bid,p_seat_price, p_seat_avail from bus@site1 where bname= p_busname;
		IF p_seat_avail>0 THEN
			DBMS_OUTPUT.PUT_LINE('seat available');
		else
			DBMS_OUTPUT.PUT_LINE('seat Not available');
		end IF;
		
	END isAvailSeat;
	
END searchAvail;
/


DECLARE
	busname bus.bname%type;
	b bus.bname%type;
	
BEGIN
	busname := '&Bus_Name';

	SELECT DISTINCT bname into b from bus@site1 where bname = busname;

	searchAvail.isAvailSeat(b);
	
EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Bus Not Available');	
		
END;
/