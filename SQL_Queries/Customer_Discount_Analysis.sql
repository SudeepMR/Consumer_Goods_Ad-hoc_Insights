#-----Task 6 ------------------

SELECT a.customer_code, a.customer, round(cast(CAST(avg(b.pre_invoice_discount_pct) as decimal(18,5)) as float)*100, 2) as average_discount_percentage
FROM gdb023.dim_customer as a
join gdb023.fact_pre_invoice_deductions as b
on a.customer_code=b.customer_code
where b.fiscal_year='2021'
group by a.customer_code, a.customer
order by 3 desc
limit 5