SELECT * FROM pizza_sales.pizza_sales;

# 1.Total Revenue:

select `pizza_name_id` , sum(`total_price`) as tot_rev
from  pizza_sales.pizza_sales
group by `pizza_name_id`;

# 2.Average Order Value:

select distinct(`order_id`),sum(total_price) / count(distinct order_id) as avg_val
from  pizza_sales.pizza_sales
group by `order_id`;

# 3.Total Pizzas Sold : 

select `pizza_name_id` , count(`quantity`) as tot_pizza
from  pizza_sales.pizza_sales
group by `pizza_name_id`;

# 4.Total Orders : 

select count(distinct(`order_id`)) as tot_order
from  pizza_sales.pizza_sales;

# 5.Average Pizzas Per Order

select `order_id` , avg(per_order) as avg_pizza_order
from
	(select `order_id` , count(`quantity`) as per_order
	from  pizza_sales.pizza_sales
	group by `order_id`) as order_counts
group by`order_id`;

# 6.Daily trends for total sales:
# Incase when using date funtion you are getting null values then the values of the table are in sting format so use str_to_date functionL

select STR_TO_DATE(order_date, '%m-%d-%Y') as daily_sales, sum(total_price) as tt_sales
from pizza_sales.pizza_sales
group by  daily_sales
order by daily_sales;

# 7.Monthly trends for total sales

select month(STR_TO_DATE(order_date, '%m-%d-%Y')) as month_sales ,sum(`total_price`) as tt_sales
from pizza_sales.pizza_sales
group by month_sales
order by month_sales;

# 8.% sales by category:

select `pizza_category`, SUM(total_price) AS category_sales,
	(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS sales_percentage
FROM pizza_sales.pizza_sales
GROUP BY `pizza_category`;

# 9.% sales by pizza size

#Sales percent for total price in pizza size and the total price in the whole table 
select `pizza_size`,(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS sales_percentage
FROM pizza_sales.pizza_sales
group by`pizza_size`;

# Catergory_sales percent for total price in pizza size and the total price in the whole table 
select `pizza_size`, SUM(total_price) AS category_sales
FROM pizza_sales.pizza_sales
group by `pizza_size`;

select `pizza_size`, SUM(total_price) AS category_sales,
	(SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales)) * 100 AS sales_percentage
FROM pizza_sales.pizza_sales
GROUP BY `pizza_size`;

#10.Total pizza sold in each category. : 

select `pizza_size` , sum(`quantity`) as tot_quan , `pizza_category`
FROM pizza_sales.pizza_sales
group by `pizza_category` , `pizza_size`
order by `pizza_size`;

#11.Top 5 pizza by revenue :

select `pizza_name_id` , sum(`total_price`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales desc
limit 5;

# 12.Bottom 5 pizza by revenue

select `pizza_name_id` , sum(`total_price`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales 
limit 5;

# 13.Top 5 pizza by Quantity :

select `pizza_name_id` , sum(`quantity`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales desc
limit 5;

# 14.Bottom 5 pizzas by Quantity:

select `pizza_name_id` , sum(`quantity`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales 
limit 5;

# 15.Top 5 pizza by total orders

select count(*) as total_table , `pizza_name_id` , sum(`quantity`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales desc
limit 5;

# 16.Bottom 5 pizzas by total orders.

select count(*) as total_table , `pizza_name_id` , sum(`quantity`)as tot_sales
FROM pizza_sales.pizza_sales
group by `pizza_name_id`
order by tot_sales
limit 5;












