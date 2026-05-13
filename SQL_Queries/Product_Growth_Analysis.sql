#---Task 2-------------------------

with firstCTE as
(
select count(distinct(a.product_code)) as unique_products_2020
from gdb023.dim_product as a
join gdb023.fact_sales_monthly as b
on a.product_code=b.product_code
where fiscal_year = 2020
), secondCTE as
(
select count(distinct(a.product_code)) as unique_products_2021
from gdb023.dim_product as a
join gdb023.fact_sales_monthly as b
on a.product_code=b.product_code
where fiscal_year = 2021
)
select firstCTE.unique_products_2020, secondCTE.unique_products_2021, ((secondCTE.unique_products_2021 - firstCTE.unique_products_2020)/firstCTE.unique_products_2020)*100 as percentage_chg
from firstCTE
cross join secondCTE