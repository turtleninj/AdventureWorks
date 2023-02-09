with
    source_creditcard as (
        select 
            cast(creditcardid as string) as cartao_de_credito_id		
            , cast(cardtype	as string) as tipo_cartao_de_credito		
        --, cast(cardnumber					
        --, cast(expmonth					
        --, cast(expyear					
        --, cast(modifieddate									
        from {{source('erp','creditcard')}}
    )
select *
from source_creditcard	
