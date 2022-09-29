select now();
select now(), now()::date - '1 day' ::interval;
show timezone;
select current_timestamp,timestamp 'now'

select date_part('year', timestamp '2020-07-30 20:38:40');
select date_part('year', current_timestamp);
select extract('isoyear' from date '2006-01-01');
select extract('isoyear' from current_timestamp);
select date_trunc('year', timestamp '2020-07-30 20:38:40');

select date_part('month', timestamp '2020-07-30 20:38:40');
select date_part('month', current_timestamp);
select extract('month' from timestamp '2020-07-30 20:38:40');
select extract('month' from interval '2 years 3 months');
select extract('month' from interval '2 years 13 months');
select date_trunc('month', timestamp '2020-07-30 20:38:40');

select date_part('day', timestamp '2020-07-30 20:38:40');
select date_trunc('day', timestamp '2020-07-30 20:38:40');

select date_part('hour', timestamp '2013-07-30 20:38:40');
select date_part('hour', interval '4 hours 3 minutes');
select date_trunc('hour', timestamp '2020-07-30 20:38:40');

select date_part('minute', timestamp '2020-07-30 20:38:40');
select date_trunc('minute', timestamp '2020-07-30 20:38:40');

select date_part('second', timestamp '2013-07-30 20:38:40');
select extract('second' from time '17:12:28.5');
select date_trunc('second', timestamp '2013-07-30 20:38:40');


 