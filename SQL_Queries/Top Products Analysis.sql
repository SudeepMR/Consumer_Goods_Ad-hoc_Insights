#----Task 10 ----------------------------

with firstCTE as
(
SELECT product_code, division, product
FROM gdb023.dim_product
), secondCTE as
(
select *
from gdb023.fact_sales_monthly
where fiscal_year='2021'
), thirdCTE as
(
select firstCTE.division as division, secondCTE.product_code as product_code, firstCTE.product as product, sum(sold_quantity) as total_sold_quantity
from firstCTE
join secondCTE
on firstCTE.product_code=secondCTE.product_code
group by 1,2,3
order by 4 desc
), forthCTE as
(
select division, product_code, product, total_sold_quantity, RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity desc) AS ranking
from thirdCTE
)
select *
from forthCTE
where ranking in ('1', '2', '3');