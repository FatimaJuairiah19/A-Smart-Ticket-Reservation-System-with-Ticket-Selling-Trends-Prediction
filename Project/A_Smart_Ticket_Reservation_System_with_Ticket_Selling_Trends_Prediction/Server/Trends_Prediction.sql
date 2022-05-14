

drop table SellingMonth cascade constraint;

create table SellingMonth(
	sid int not null,
	times varchar2(15),
	months varchar2(20),
	rid int,
	fromto varchar2(15),
	bid int,
	tid int,
	noOfTickets number,
	amount number
	);


insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (1,'9pm','February',1,'dhk-ctg',1,1,3,3000);	
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (1,'9pm','February',1,'dhk-ctg',1,2,3,2000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (1,'10pm','February',1,'dhk-ctg',1,3,2,1000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (2,'10pm','March',1,'dhk-ctg',1,4,2,1000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (2,'10pm','March',3,'dhk-svr',1,5,2,1000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (1,'11pm','February',1,'dhk-sylhet',3,6,2,1000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (3,'7pm','January',1,'dhk-sylhet',3,7,2,2000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (3,'7pm','January',2,'dhk-svr',2,8,3,3000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (3,'7pm','January',2,'dhk-svr',2,9,3,3000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (3,'8pm','January',2,'dhk-svr',2,10,2,2000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (1,'9pm','February',2,'dhk-ctg',1,11,3,3000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (2,'10pm','March',1,'dhk-ctg',1,12,2,1000);
insert into SellingMonth(sid,times,months,rid,fromto,bid,tid,noOfTickets,amount) values (2,'10pm','March',1,'dhk-ctg',1,13,1,1000);

commit;