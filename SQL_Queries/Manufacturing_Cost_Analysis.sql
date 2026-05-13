#----Task 5 ----------

with firstCTE as
(
SELECT a.product_code, a.product, min(b.manufacturing_cost) as manufacturing_cost
FROM gdb023.dim_product as a
join gdb023.fact_manufacturing_cost as b
on a.product_code=b.product_code
group by a.product_code, a.product
order by 3
limit 1
), secondCTE as
(
SELECT a.product_code, a.product, max(b.manufacturing_cost) as manufacturing_cost
FROM gdb023.dim_product as a
join gdb023.fact_manufacturing_cost as b
on a.product_code=b.product_code
group by a.product_code, a.product
order by 3 desc
limit 1
)
select *
from firstCTE
union
select *
from secondCTE