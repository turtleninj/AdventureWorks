with
    cartao as (
        select * 
        from {{ref('stg_erp__creditcard')}}
    )

    , transformed as (
        select
            row_number() over (order by cartao_de_credito_id) as sk_cartao
            , cartao_de_credito_id           
            , tipo_cartao_de_credito
        from cartao
    )

select *
from transformed

