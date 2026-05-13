#----Task 7 -------------------

with firstCTE as
(
SELECT month(a.date) as month, year(a.date) as year, b.fiscal_year as fiscal_year, a.product_code, (a.sold_quantity*b.gross_price) as Gross_Sales_Amount
FROM gdb023.fact_sales_monthly as a
join gdb023.fact_gross_price as b
on a.product_code=b.product_code and a.fiscal_year=b.fiscal_year
where a.customer_code in(SELECT customer_code FROM gdb023.dim_customer where customer='Atliq Exclusive')
)
select month, year, sum(Gross_Sales_Amount) as Gross_Sales_Amount
from firstCTE
group by 1,2
order by 2