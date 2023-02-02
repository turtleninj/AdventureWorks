with
    product as (
        select * 
        from {{ref('stg_erp__product')}}
    )

   , productsubcategory as (
       select * 	
       from {{ref('stg_erp__productsubcategory')}}
    )

   , productcategory as (
       select * 	
       from {{ref('stg_erp__productcategory')}}
    )
  

    , uniao_tabela as (
        select
            product.produtos_id
            ,case
                when product.sub_categ_prod_id is null then 'Não identificado'
                else product.sub_categ_prod_id
                end as sub_categ_prod_id
            ,productsubcategory.categ_prod_id
            ,product.name
            ,productsubcategory.subcategoria
            ,productcategory.categoria

		
            
        from product
        left join productsubcategory on product.sub_categ_prod_id = productsubcategory.sub_categ_prod_id
        left join productcategory on productsubcategory.categ_prod_id = productcategory.categ_prod_id    
        )

    , transformacoes as (
        select
            row_number() over (order by produtos_id) as sk_produto
            , *
        from uniao_tabela 
    )
select *
from transformacoes

