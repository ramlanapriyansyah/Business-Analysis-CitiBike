with hotels as (
	select * from hotel_revenue_2018
	union
	select * from hotel_revenue_2019
	union
	select * from hotel_revenue_2020
)
select
	arrival_date_year,
	hotel,
	sum((stays_in_weekend_night + stays_in_week_nights)*adr) as revenue
from hotels
group by arrival_date_year, hotel
order by arrival_date_year, hotel;

create table market_segment$(
	discount decimal,
	market_segment varchar(50)
);

insert into market_segment$(discount, market_segment)
values	(0, 'Undefined'),
		(0.1, 'Direct'),
		(0.1, 'Groups'),
		(0.15, 'Corporate'),
		(0.2, 'Aviation'),
		(0.3, 'Offline TA/TO'),
		(0.3, 'Online TA'),
		(1, 'Complementary');
		
select * from market_segment$;

create table meal_cost$ (
	cost decimal,
	meal varchar(50)
);

insert into meal_cost$
values	(0, 'Undefined'),
		(12.99, 'BB'),
		(17.99, 'HB'),
		(21.99, 'FB'),
		(35, 'SC');

with hotels as (
	select * from hotel_revenue_2018
	union
	select * from hotel_revenue_2019
	union
	select * from hotel_revenue_2020)
select * from hotels h
left join market_segment$ m on(
	h.market_segment = m.market_segment)
left join meal_cost$ mc on(
	h.meal = mc.meal);