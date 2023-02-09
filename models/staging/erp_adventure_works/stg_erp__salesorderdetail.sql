with
    source_salesorderdetail as (
        select 
            cast(salesorderid as string) as pedido_id
            ,cast(salesorderdetailid as string) as detalhe_pedido_id		
            -- , cast (carriertrackingnumber					
            , cast (orderqty as int) as qnt_pedido				
            , cast (productid as string) as produto_id					
            --, cast (specialofferid					
            , cast (unitprice as float64) as preco_unitario			
            , cast (unitpricediscount as float64) as desconto_preco_unitario					
            --, cast (rowguid					
            --, cast (modifieddate						
        from {{source('erp','salesorderdetail')}}
    )
select *
from source_salesorderdetail
