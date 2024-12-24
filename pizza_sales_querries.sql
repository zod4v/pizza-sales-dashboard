
-- 1. KPI's  
select sum(total_price) as total_revenue from pizza_sales

select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales

select sum(quantity) as total_pizza_ordered from pizza_sales

select count(distinct order_id) as total_orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2))
as avg_pizza_perOrder from pizza_sales

-- 2. Charts

select DATENAME(dw, order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(dw, order_date)

select DATENAME(MONTH, order_date) as month_name, count (distinct Order_id) as total_orders from pizza_sales
group by datename(month, order_date)


select pizza_category,sum(total_price) as total_sales, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date) =1)  as total_sales_percent
from pizza_sales
where month(order_date)=1
group by pizza_category

select pizza_size,cast(sum(total_price) as decimal(10,2)) as total_sales, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2)) as total_sales_percent
from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by total_sales_percent	

select top 5 pizza_name, cast(sum(total_price)as decimal(10,2)) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

select top 5 pizza_name, cast(sum(total_price)as decimal(10,2)) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc

select * from pizza_sales
