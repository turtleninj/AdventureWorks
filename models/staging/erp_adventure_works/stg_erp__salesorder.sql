with
    source_salesorder as (
        select 
            cast(salesorderid as string) as pedido_id
            --, cast(revisionnumber	as ) 				
            , cast(orderdate as timestamp) as data_do_pedido				
            , cast(duedate as timestamp) as data_de_vencimento					
            , cast(shipdate as timestamp) as data_de_envio					
            , cast(status as int) as status				
            --, cast(onlineorderflag 					
            --, cast(purchaseordernumber					
            --, cast(accountnumber					
            , cast(customerid as string) as identificacao_do_cliente					
            --, cast(salespersonid					
            , cast(territoryid as int) as id_territorio 				
            --, cast(billtoaddressid					
            , cast(shiptoaddressid as int) as endereco_id				
            --, cast(shipmethodid					
            , cast(creditcardid	as string) as id_cartao_credito				
            --, cast(creditcardapprovalcode					
            --, cast(currencyrateid					
            , cast(subtotal	as float64)	as subtotal			
            , cast(taxamt as float64) as taxamt			
            , cast(freight as float64) as frete					
            , cast(totaldue as float64) as totaldue					
            --, cast(comment					
            --, cast(rowguid					
            --, cast(modifieddate			
        from {{source('erp','salesorderheader')}}
    )
select *
from source_salesorder