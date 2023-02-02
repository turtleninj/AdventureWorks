with
    source_person as (
        select 
            cast(businessentityid as int) as entidade_de_negocio_id		
            --, persontype					
            --, namestyle					
            --, title					
            , cast(firstname as string) as nome				
            --, middlename					
            , cast(lastname as string) as sobrenome					
            --, suffix					
            --, emailpromotion					
            --, additionalcontactinfo					
            --, demographics					
            --, rowguid					
            --, modifieddate									
        from {{source('erp','person')}}
    )
select *
from source_person