


set serveroutput on;
set verify off;




create or replace function returnMon(Tidd in transactions.tid%type, busname in bus.bname%type, tseats in transactions.quantity%type)
	return number is
	
	n number;
	error exception;
	
begin
	
	--select amount into n from transactions@site1 where transactions.tid = Tidd;
	select price into n from bus@site1 where bus.bname = busname;
		
	return n*tseats;
	exception when no_data_found then 
		dbms_output.put_line('No data found'); 
		when others then
        dbms_output.put_line('Error!'); 

	
	
end returnMon;
/



create or replace procedure canUpdateSeats(Tidd in transactions.tid%type, tseats in transactions.quantity%type)
	is
	
	n int;
	Bidd bus.bid%type;
	error exception;

begin
    
	select quantity, bid into n, Bidd from transactions@site1 where transactions.tid = Tidd;
	update bus@site1 set avail = avail + n where Bidd = bus.bid;
	if tseats = n then
		delete from transactions@site1 where transactions.tid = Tidd;
	else 
		update transactions@site1 set quantity = quantity - tseats WHERE tid = Tidd;
	end if;	
	commit;
	
	

end canUpdateSeats;
/



declare 
    busname bus.bname% type := '&Bus_Name';
	seats transactions.quantity%type := &Number_of_seats;
	--ticketsTaken transactions.quantity%type;
	name transactions.pname%type := '&Passenger_Name';
	Tidd transactions.tid%type ;
	x number;
	
begin 
	
	select tid into Tidd FROM transactions@site1 where pname = name ;	
	x := returnMon(Tidd,busname,seats);
	DBMS_OUTPUT.PUT_LINE('Customer will get '||x);
	canUpdateSeats(Tidd,seats);
	EXCEPTION	
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No such Transaction');	
	
end; 
/