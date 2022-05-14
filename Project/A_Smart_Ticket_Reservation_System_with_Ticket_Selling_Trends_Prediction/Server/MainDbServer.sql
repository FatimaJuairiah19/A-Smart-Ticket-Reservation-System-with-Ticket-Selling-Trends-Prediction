

drop table route1 cascade constraint;


drop table route1 cascade constraint;

create table route1(
	rid int not null,
	fromto varchar2(15),
	pickup_point varchar2(15),
	primary key(rid)
	);


insert into route1 (rid, fromto, pickup_point) values(1, 'dhk_Chittagong', 'klpr'); 
insert into route1 (rid, fromto, pickup_point) values(2, 'dhk_Khulna', 'mtjl'); 

commit;