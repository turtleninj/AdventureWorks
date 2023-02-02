with
    source_productsubcategory as (
        select 
            cast(productsubcategoryid as string) as sub_categ_prod_id		
            , cast(productcategoryid as string) as categ_prod_id			
            , cast(name	as string) as subcategoria			
            --, cast(rowguid	STRING				
            --, cast(modifieddate	STRING							
        from {{source('erp','productsubcategory')}}
    )
select *
from source_productsubcategory
