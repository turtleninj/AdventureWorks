with
    source_salesorderheadersalesreason as (
        select 
        -- terminar ajuste
            cast(salesorderid as string) as pedido_id
            , cast(salesreasonid as	string) as razao_venda_id		
            --, cast(modifieddate
        from {{source('erp','salesorderheadersalesreason')}}
    )
select *
from source_salesorderheadersalesreason

