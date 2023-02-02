with
    source_salesorderheadersalesreason as (
        select 
        -- terminar ajuste
            cast(salesorderid as int) as venda_id
            , cast(salesreasonid as	int) as motivo_da_venda_id		
            --, cast(modifieddate
        from {{source('erp','salesorderheadersalesreason')}}
    )
select *
from source_salesorderheadersalesreason