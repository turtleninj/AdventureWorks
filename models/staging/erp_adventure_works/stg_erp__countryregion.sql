with
    source_countryregion as (
        select 
            cast(countryregioncode as string) as sigla_pais		
            , cast(name as string) as pais			
           -- , cast(modifieddate as string)										
        from {{source('erp','countryregion')}}
    )
select *
from source_countryregion