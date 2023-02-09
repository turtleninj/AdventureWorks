with
    address as (
        select * 
        from {{ref('stg_erp__address')}}
    )

   , countryregion as (
       select * 	
       from {{ref('stg_erp__countryregion')}}
    )

   , stateprovince as (
       select * 	
       from {{ref('stg_erp__stateprovince')}}
    )
  

    , uniao_tabela as (
        select
            address.endereco_id
            ,countryregion.pais
            , stateprovince.estado
            , address.cidade
	
            
        from address
        left join stateprovince on address.estado_id = stateprovince.estado_id
        left join countryregion on stateprovince.sigla_pais = countryregion.sigla_pais   
        group by 
            countryregion.pais
            , stateprovince.estado
            , address.cidade
            , address.endereco_id
        )

    , transformacoes as (
        select
            row_number() over (order by cidade) as sk_territorio
            , *
        from uniao_tabela 
     )
select *
from transformacoes



	
		
		
