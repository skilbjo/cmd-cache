with date as (
		select (current_date - interval '1 day')::date now
	) 
select
	sum(f."Principal Balance Remaining In Cents"/100)::money PrincipalLeft
from
	dw.loan_status_snapshot_fact f
	inner join dw.loan_dim loan on f.loan_id = loan.id
where
	f."Snapshot Date" in ( select now from date )
	
limit 60	;


