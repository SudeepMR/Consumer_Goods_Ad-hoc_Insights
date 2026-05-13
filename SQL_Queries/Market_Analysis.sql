#---Task 1-------------------------

SELECT distinct(market)
FROM gdb023.dim_customer
where customer = "Atliq Exclusive" and region = "APAC"
order by market