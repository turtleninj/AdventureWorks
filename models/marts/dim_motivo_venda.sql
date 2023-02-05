with
    motivo_venda as (
        select * 
        from {{ref('stg_erp__salesreason')}}
    )

    , transformed as (
        select
            row_number() over (order by razao_venda_id) as sk_motivo_venda
            , razao_venda_id
            , razao_venda
            , origem_razao
        from motivo_venda
    )

select *
from transformed


