#----Task 8 ----------

with firstCTE as
(
SELECT date, year(date) as year, quarter(date) as Quarter, sold_quantity
FROM gdb023.fact_sales_monthly
)
select quarter, sum(sold_quantity) as total_sold_quantity
from firstCTE
where year='2020'
group by Quarter
order by 1