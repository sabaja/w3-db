SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;
SELECT country, count(*) as num FROM Customers group by country order by num desc;

select max(C.num) from
(SELECT country, count(*) as num FROM Customers group by country order by num desc) as C 
group by C.country;

-------------------------------------------------------------------------------------
--- Identificare la nazione che ha il maggior numero di customer --------------------
--- Poi ottenere i customer appartenenti a quella nazione ---------------------------
-------------------------------------------------------------------------------------

--1 - Con WITH e JOIN
with MAX_COUNTRY 
as (
		select country, count(*) as num 
		from Customers 
		group by country 
		order by num 
		desc limit 1
) 
select c.* 
from Customers c 
join MAX_COUNTRY mc on c.country = mc.country;

--Con WHERE e LIMIT
select * from Customers
where country = (
	select country 
	from Customers 
	group by country 
	order by count(*) 
	desc limit 1 
);

-- Con HAVING e MAX() più formale e più complessa
select c.* from customers c --> Tutti customer appartenenti a quella nazione (4)
where c.country in (
	select country  			--
		from customers c 		--> TROVA LA NAZIONE PIU' POPOLASA RISPETTO AI CUSTOMER (3)
		group by c.country 		--
		having count(*) = (
			select max(C_CNT.cnt) -- > TROVA IL NUMERO PIU' GRANDE RELATIVO ALLE NAZIONI  (2)
				from (select count(c.country) as cnt 	-- 
				from Customers c				  		-- > CONTA QUANTI CUSTOMER PER NAZIONE (1)
				group by c.country) C_CNT         		--
	)
) order by c.customername;

-- Per avere 