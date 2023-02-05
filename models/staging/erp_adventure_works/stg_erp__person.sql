with
    source_person as (
        select 
            cast(businessentityid as int) as entidade_de_negocio_id		
            , cast(firstname as string) as nome				
            , cast(lastname as string) as sobrenome
            , cast((firstname || ' ' || lastname) as string) nome_cliente
            --, middlename					
            --, persontype					
            --, namestyle					
            --, title					
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