/* This is task 1 */
 select * 
 from survey
 limit 10;
 
/* This is query for task 2 */
 select question, count(distinct user_id)
 from survey
 group by question;
 
 /* This is query for task 4 */
 select *
from quiz
limit 5;

select *
from home_try_on
limit 5;

select *
from purchase
limit 5;

/* This is query for task 5 */
select distinct q.user_id,
	h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  p.user_id is not null as 'is_purchase'
from quiz as 'q'
left join home_try_on as 'h'
	on q.user_id = h.user_id
left join purchase as 'p'
	on p.user_id = q.user_id
limit 10;

/* Task 6 Code */
with sales_conversion as (select distinct q.user_id,
	h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  p.user_id is not null as 'is_purchase'
from quiz as 'q'
left join home_try_on as 'h'
	on q.user_id = h.user_id
left join purchase as 'p'
	on p.user_id = q.user_id
	)
select count(*) as 'browse',
	sum(is_home_try_on) as 'try_on',
  sum(is_purchase) as 'purchase'
  from sales_conversion;
  
/* Task 6.1 Code */
with sales_conversion as (select distinct q.user_id,
	h.user_id is not null as 'is_home_try_on',
  h.number_of_pairs,
  p.user_id is not null as 'is_purchase'
from quiz as 'q'
left join home_try_on as 'h'
	on q.user_id = h.user_id
left join purchase as 'p'
	on p.user_id = q.user_id
    )
select count(*) as 'browse',
	sum(is_home_try_on) as 'try_on',
  sum(is_purchase) as 'purchase',
  1.0 * sum(is_home_try_on) / count(user_id) as '%try_on',
  1.0 * sum(is_purchase) / sum(is_home_try_on) as '%Purch'
  from sales_conversion;
  
  /* Task 6.2 Code Survey Analysis */
  select *,
	count(distinct user_id)
from survey
group by 3
order by 1 asc;