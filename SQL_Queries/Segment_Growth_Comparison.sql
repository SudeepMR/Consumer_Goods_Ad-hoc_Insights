#---Task 4-------------------

with SomeCTE as
(
select a.segment as segment, count(distinct(a.product_code)) as product_count_2020
from gdb023.dim_product as a
join gdb023.fact_sales_monthly as b
on a.product_code=b.product_code
where fiscal_year = 2020
group by a.segment
), AnotherCTE as
(
select a.segment as segment, count(distinct(a.product_code)) as product_count_2021
from gdb023.dim_product as a
join gdb023.fact_sales_monthly as b
on a.product_code=b.product_code
where fiscal_year = 2021
group by a.segment
)
SELECT SomeCTE.segment, SomeCTE.product_count_2020, AnotherCTE.product_count_2021, (AnotherCTE.product_count_2021-SomeCTE.product_count_2020) as difference
FROM SomeCTE LEFT JOIN
     AnotherCTE ON SomeCTE.segment=AnotherCTE.segment
     order by 4 desc