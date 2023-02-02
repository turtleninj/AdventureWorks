with
    source_creditcard as (
        select 
            cast(creditcardid as int) as cartao_de_credito_id		
            , cast(cardtype	as string) as tipo_cartao_de_credito		
        --, cast(cardnumber	INTEGER	NULLABLE			
        --, cast(expmonth	INTEGER	NULLABLE			
        --, cast(expyear	INTEGER	NULLABLE			
        --, cast(modifieddate	STRING	NULLABLE							
        from {{source('erp','creditcard')}}
    )
select *
from source_creditcard	
