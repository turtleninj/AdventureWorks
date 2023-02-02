with
    source_product as (
        select 
            cast(productid as string) as produtos_id
            ,cast(productsubcategoryid as string) as sub_categ_prod_id				
            ,cast(name as string) as name					
            --,cast(productnumber	as string) as numero_produto				
            --,cast(makeflag					
            --,cast(finishedgoodsflag					
            --,cast(color					
            --,cast(safetystocklevel					
            --,cast(reorderpoint					
            --,cast(standardcost					
            --,cast(listprice					
            --,cast(size					
            --,cast(sizeunitmeasurecode					
            --,cast(weightunitmeasurecode					
            --,cast(weight					
            --,cast(daystomanufacture					
            --,cast(productline					
            --,cast(class					
            --,cast(style					
            --,cast(productmodelid					
            --,cast(sellstartdate					
            --,cast(sellenddate					
            --,cast(discontinueddate					
            --,cast(rowguid					
            --,cast(modifieddate						
        from {{source('erp','product')}}
    )
select *
from source_product