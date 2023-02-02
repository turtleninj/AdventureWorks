with
    salesterritory as (
        select * 
        from {{ref('stg_erp__salesterritory')}}
    )

    , transformed as (
        select
            row_number() over (order by territorio_id ) as sk_territorio
			, *
        from salesterritory
    )

select *
from transformed

-- , territorio_id
-- , nome_territorio

	
		
		
