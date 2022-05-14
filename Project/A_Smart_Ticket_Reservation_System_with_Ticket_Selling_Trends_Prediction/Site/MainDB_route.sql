

clear screen;

drop table route cascade constraint;
drop table route2 cascade constraint;



create table route2(
	rid int not null,
	fromto varchar2(15),
	pickup_point varchar2(15),
	primary key(rid)
	);

insert into route2(rid, fromto, pickup_point) values(3, 'dhk_svr', 'klpr'); 



create table route(
	rid int not null,
	fromto varchar2(15),
	pickup_point varchar2(15),
	primary key(rid)
	);

commit;