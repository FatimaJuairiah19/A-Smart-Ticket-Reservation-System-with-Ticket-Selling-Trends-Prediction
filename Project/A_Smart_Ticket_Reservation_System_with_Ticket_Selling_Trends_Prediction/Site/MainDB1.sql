


drop table schedule cascade constraint;
drop table bus cascade constraint;
drop table transactions cascade constraint;
drop table rating cascade constraint;

clear screen;



create table schedule(
	sid int not null,
	times varchar2(15),
	dates varchar2(15),
	rid int,
	primary key(sid),
	foreign key(rid) references route(rid)
	);
drop sequence s_seq;
create sequence s_seq start with 1 increment by 1 nomaxvalue; 



insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '09:00pm', '30.09.2022', 1);
insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '10:00pm', '30.09.2022', 2);
insert into schedule(sid, times, dates, rid) values(s_seq.nextval, '08:00pm', '29.09.2022', 3);

create table bus(
	bid int not null,
	bname varchar2(15),
	rid int,
	sid int,
	avail int,
	total_seats int,
	price int,
	primary key(bid),
	foreign key(rid) references route(rid)
	);
drop sequence b_seq;
create sequence b_seq start with 1 increment by 1 nomaxvalue; 


insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'volvo', 40, 40, 1000, 1, 1);
insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'hino', 30, 30, 1200, 2, 2);
insert into bus(bid, bname, avail, total_seats, price, rid, sid) values (b_seq.nextval, 'mazda', 40, 40, 2000, 3, 3);


create table transactions(
	tid int not null,  
	bid int,          
	rid int,         
	sid int,          
	pname varchar2(15), 
	phn varchar2(20),   
	quantity int,
	amount int,
	primary key(tid),
	foreign key(sid) references schedule(sid),
	foreign key(rid) references route(rid),
	foreign key(bid) references bus(bid)
);
drop sequence t_seq;
create sequence t_seq start with 1 increment by 1 nomaxvalue; 

insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 1, 1, 1, 'Maisha', '01910323262', 2, 2000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 2, 1, 2, 'Maria', '01910325662', 1, 1000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 3, 3, 3, 'Farsheed', '01910409262', 3, 3000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 3, 1, 3, 'Enan', '01910409262', 1, 2000);
insert into transactions(tid, bid, rid, sid, pname, phn, quantity, amount) values (t_seq.nextval, 2, 2, 2, 'Hasan', '01910409262', 1, 2400);

CREATE table rating(
	rating_id int,
	pname VARCHAR2(30), 
	bname varchar2(15),
	rating_score NUMBER, 
	review VARCHAR2(200)
);


INSERT into rating(rating_id,pname,bname,rating_score,review) values (rating_seq.nextval,'Maisha','volvo',4,'good service');
INSERT into rating(rating_id,pname,bname,rating_score,review) values (rating_seq.nextval,'Tuhin','hino',3,'not a good service');
INSERT into rating(rating_id,pname,bname,rating_score,review) values (rating_seq.nextval,'Enan','hino',4,'Medium');
INSERT into rating(rating_id,pname,bname,rating_score,review) values (rating_seq.nextval,'Farsheed','mazda',5.0,'Excellent service');



create or replace view viewRating(view_rating_score,view_review) as select rating_score, review from rating;


/*
SELECT bname ,AVG (rating_score) FROM RATING GROUP BY bname ORDER BY AVG(rating_score) DESC;


SELECT COUNT(rid), rid from transactions 
     GROUP BY rid ORDER  BY count(*) DESC;
*/	 

commit;
