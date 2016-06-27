select 
	bd.* 
from 
	dw.business_dim bd 
	inner join dw.loan_dim ld on (ld.id::text = bd."Loan Application UUID") 
where 
	bd."Primary City" in ('San Francisco')

