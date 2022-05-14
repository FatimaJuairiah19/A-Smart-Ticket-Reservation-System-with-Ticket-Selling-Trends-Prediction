
/*
create or replace view viewRating(view_rating_score,view_review) as select rating_score, review from rating;

*/

select * from viewRating@site1;

