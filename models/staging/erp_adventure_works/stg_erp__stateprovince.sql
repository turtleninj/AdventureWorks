with
    source_stateprovince as (
        select 
            cast(stateprovinceid as int) as estado_id				
            ,cast(stateprovincecode as string) as sigla_estado
            ,cast(countryregioncode as string) as sigla_pais
            --,cast(isonlystateprovinceflag as ) as
            ,cast(name as string) as estado
            ,cast(territoryid as int) as territorio_id
            -- ,cast(rowguid as ) as
            -- ,cast(modifieddate as ) as
        from {{source('erp','stateprovince')}}
    )
select *
from source_stateprovince