with
    source_customer as (
        select 
            cast(customerid as int) as cliente_id			
            --, cast(personid				
            --, cast(storeid				
            --, cast(territoryid				
            --, cast(rowguid	STRING			
            --, cast(modifieddate	
        from {{source('erp','customer')}}
    )
select *
from source_customer	