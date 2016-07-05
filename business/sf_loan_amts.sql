select 
	biz."NAICS Industry", sum(loan."Principal Lent In Cents"/100)::money loan_amt, count(*)
from 
	dw.business_dim biz 
	inner join dw.loan_dim loan on (loan.id::text = biz."Loan Application UUID") 
where 
	biz."Primary City" in ('San Francisco')
	and extract(year from loan."Origination Date") >= 2015
group by	biz."NAICS Industry"
order by 2 desc
	
	;
	
