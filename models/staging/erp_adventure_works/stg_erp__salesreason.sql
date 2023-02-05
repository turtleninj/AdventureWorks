with
    source_salesreason as (
        select 
        cast(salesreasonid as string) as razao_venda_id			
        , cast(name as string) as razao_venda
        , cast(reasontype as string) as origem_razao			
        --,cast(smodifieddate			
        from {{source('erp','salesreason')}}
    )
select *
from source_salesreason