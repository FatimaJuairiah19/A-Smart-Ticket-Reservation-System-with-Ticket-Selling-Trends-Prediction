set serveroutput on;
set verify off;


create or replace trigger trig_bus
after insert or update on bus
begin

	dbms_output.put_line('Available number of seat of a bus is updated');
	
end;
/



create or replace function totalPrice(bid_f in out number, num in out number)
	return number 
	is
	
	n number;
	
begin
	
	select price into n from bus where bid_f = bus.bid;
		
	return n*num;
	exception when no_data_found then 
        dbms_output.put_line('No data found!'); 
		
end totalPrice;
/

create or replace procedure create_Transaction(p_tid in transactions.tid%type,b_bid in bus.bid%type,p_name in transactions.pname%type,p_number in transactions.phn%type,
	p_quantity transactions.quantity%type,p_amount transactions.amount%type)
	is

	p_rid transactions.rid%type;
	p_sid transactions.sid%type;
	error exception;
	
	begin
		select rid, sid into p_rid, p_sid from bus where bus.bid = b_bid;
	
		insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (p_tid, b_bid, p_rid, p_sid , p_name , p_number, p_quantity, p_amount);
		exception 
		when no_data_found then 
			dbms_output.put_line('No data found');
		when others then
        	dbms_output.put_line('Error in create!');
        	
end create_Transaction;
/



create or replace procedure updateSeats(bid_f in bus.bid%type, num in transactions.quantity%type)
	is
	
	n int;
	error exception;

begin

	select avail into n from bus where bid_f = bus.bid;

	if n-num >= 0 then
		n := n-num;
		update bus set avail = n where bid_f = bus.bid;
		commit;
	elsif n-num < 0 then
		raise error;
	end if;
	
	exception when no_data_found then 
		dbms_output.put_line('No such bus!'); 
		when error then
		dbms_output.put_line('Not enough seats available');
		when others then
        dbms_output.put_line('Error at update!');
    
end updateSeats;
/




declare 
 
	Bid bus.bid%type := &Bus_Id;
	seats transactions.quantity%type := &Number_of_seats;
	name transactions.pname%type := '&Passenger_Name';
	phn transactions.phn%type := '&Phn_Number';
	Tidd transactions.tid%type;
	x transactions.amount%type;
	
	
begin
	
	x := totalPrice(Bid,seats);
	DBMS_OUTPUT.PUT_LINE('Total price of tickets is '||x);
	FOR R IN (select transactions.tid FROM transactions) 
		LOOP
			Tidd := R.tid;
		END LOOP;
	Tidd := Tidd + 1;	
	DBMS_OUTPUT.PUT_LINE('transction id id '||Tidd);
	create_Transaction(Tidd,Bid,name,phn,seats,x);
	updateSeats(Bid,seats);
	
	
end; 
/