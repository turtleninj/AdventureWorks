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
            --,case
            --    when product.sub_categ_prod_id is null then 'Não identificado'
            --    else product.sub_categ_prod_id
            --    end as sub_categ_prod_id
            --,case
            --    when productsubcategory.categ_prod_id is null then 'Não identificado'
            --    else productsubcategory.categ_prod_id
            --    end as categ_prod_id
            ,product.name
            ,case
                when productsubcategory.subcategoria is null then 'Não identificado'
                else productsubcategory.subcategoria
                end as subcategoria
            ,case
                when productcategory.categoria is null then 'Não identificado'
                else productcategory.categoria
                end as categoria

		
            
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

