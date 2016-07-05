select 
--	biz."NAICS Industry", 
	biz."Primary State",
	sum(loan."Principal Lent In Cents"/100)::money loan_amt, count(*)
from 
	dw.business_dim biz 
	inner join dw.loan_dim loan on (loan.id::text = biz."Loan Application UUID") 
where	1=1 
--	and biz."Primary City" in ('San Francisco')
	and extract(year from loan."Origination Date") >= 2015
group by	
--	biz."NAICS Industry",
	biz."Primary State"
order by 2 desc	
