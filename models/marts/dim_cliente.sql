with
    person as (
        select * 
        from {{ref('stg_erp__person')}}
    )

--    , uniao_tabela as ( 
--        select
--            person.entidade_de_negocio_id		
--            , person.nome				
--            , person.sobrenome	
--        from person
--        -- como fazer o join de colunas?
--    )

    , transformed as (
        select
            row_number() over (order by entidade_de_negocio_id ) as sk_person
            , entidade_de_negocio_id
            , nome
            , sobrenome
        from person
    )

select *
from transformed
