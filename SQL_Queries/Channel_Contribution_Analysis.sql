#----Task 9 ------

with firstCTE as
(
SELECT a.date, c.channel, a.sold_quantity, b.gross_price, (a.sold_quantity*b.gross_price) as total_gross_price, a.fiscal_year
FROM gdb023.fact_sales_monthly as a
join gdb023.fact_gross_price as b
on a.product_code=b.product_code and a.fiscal_year=b.fiscal_year
join gdb023.dim_customer as c
on a.customer_code=c.customer_code
),secondCTE as
(
select channel, sum(total_gross_price) as total_gross_price
from firstCTE
where fiscal_year='2021'
group by 1
order by 2
)
select channel, total_gross_price, CONCAT(round((total_gross_price / 1000000)), ' M') as  gross_sales_mln, round((total_gross_price*100/(select sum(total_gross_price) from secondCTE)), 2) as 'percentage'
from secondCTE
group by 1