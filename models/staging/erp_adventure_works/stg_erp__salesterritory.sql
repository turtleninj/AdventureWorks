with
    source_salesterritory as (
        select 
            cast(territoryid as int) as territorio_id		
            , cast(name	as string) as nome_territorio			
            --, cast(countryregioncode	STRING				
            --, cast(group	STRING				
            --, cast(salesytd	FLOAT				
            --, cast(saleslastyear	FLOAT				
            --, cast(costytd	INTEGER				
            --, cast(costlastyear	INTEGER				
            --, cast(rowguid	STRING	NULLABLE			
            --, cast(modifieddate	STRING	NULLABLE							
        from {{source('erp','salesterritory')}}
    )
select *
from source_salesterritory	

	