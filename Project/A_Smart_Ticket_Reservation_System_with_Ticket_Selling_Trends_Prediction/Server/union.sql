

insert into route@site1
select * from (
SELECT * FROM route1 
UNION
SELECT * FROM route2@site1
)
commit;