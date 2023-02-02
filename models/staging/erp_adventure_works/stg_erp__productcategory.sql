with
    source_productcategory as (
        select 
            cast(productcategoryid as string) as categ_prod_id		
            , cast(name	as string) as categoria			
            --, cast(rowguid					
            --, cast(modifieddate									
        from {{source('erp','productcategory')}}
    )
select *
from source_productcategory


