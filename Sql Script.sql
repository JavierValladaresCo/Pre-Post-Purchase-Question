-- create database PrepostQuestions; -- Create the database

USE PrepostQuestions; -- Select the database

SET GLOBAL log_bin_trust_function_creators = 1; -- Set global variables to create functions

set sql_safe_updates = 0; -- Allow table modifications

select * from datos_question; -- Print table

select count(*) from datos_question; -- Total rows

select distinct label from datos_question;

delete from datos_question 
where lower(label) not in ('pre', 'post'); -- Delete random labels

delete from datos_question
where lower(label) = 'pre' and hours_diff > 0; -- Delete pre question with positive hours_diff

select * from filtered_hours
where length(item_name) <= 6; -- item_name preprocessing

select * from filtered_hours
where length(question) <= 6; -- question preprocessing

select * from filtered_hours
where length(question) <= 6; -- question preprocessing

delete from datos_question 
where length(question) <= 5
or length(item_name) <= 5; -- Delete inconsistent text

select * from filtered_hours
where item_name like '%&&&&%'
or item_name like '???%'; -- show inconsistent item names

delete from datos_question 
where item_name like '%&&&&%'
or item_name like '???%'; -- Delete inconsistent item names

update datos_question set question = lower(question), 
							item_name = lower(item_name), 
							label = lower(label); -- Lower questions, item_name and labels

select distinct label from datos_question; -- Check label preprocessing

create view filtered_hours as (
with aux_pre as ( select *,
					percent_rank() over (partition by label order by hours_diff desc) as rank_per
                    from datos_question
					where label = 'pre'), -- Percent rank of pre question hours_diff
aux_post as ( select *,
			percent_rank() over (partition by label order by hours_diff asc) as rank_per
            from datos_question
            where label = 'post') -- Percent rank of post question hours_diff
select * from aux_post
where aux_post.rank_per >= 0.05
union 
select * from aux_pre
where aux_pre.rank_per >= 0.05
order by hours_diff asc); -- Remove the top 5 percentil of hours_diff from each label and create a view of the table

select * from filtered_hours; -- show view

with aux_total as (
	select case when label = 'pre' then 1
            else 0
            end as total_pre,
			case when label = 'post' then 1
            else 0
            end as total_post
	from filtered_hours
)
select round(sum(total_pre) * 100 / count(*), 0) as pre_questions, 
		round(sum(total_post) * 100 / count(*), 0) as post_questions 
from aux_total; -- Percentage of pre and post question of the data

create view dist_text as select *, 
						cume_dist() over (partition by label order by question_len) as dist_question,
						cume_dist() over (partition by label order by item_len) as dist_name
						from (select *,
									length(question) as question_len,
									length(item_name) as item_len
							from filtered_hours) as aux_table; -- Total len of item and question
                            
select * from dist_text;

select count(*) from  dist_text
where question like '%ship%';

-- https://aws.amazon.com/marketplace/pp/prodview-sgujhcju77x42?sr=0-4&ref_=beagle&applicationId=AWSMPContessa#similar-products
		











