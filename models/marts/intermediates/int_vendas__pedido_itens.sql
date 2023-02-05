with
    pedidos as (
        select *
        from {{ ref('stg_erp__salesorder') }}
    )

    , pedido_item as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    )

    , motivo_venda as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason')}}
    )
    

    ,joined as (
        select
            pedidos.pedido_id
            , pedido_item.detalhe_pedido_id	
            , pedido_item.produto_id
            , pedidos.id_territorio 				
            , pedidos.id_cartao_credito
            , pedidos.endereco_id
            , motivo_venda.razao_venda_id						
            , pedido_item.qnt_pedido				
            , pedido_item.preco_unitario			
            , pedido_item.desconto_preco_unitario
            , pedidos.subtotal			
            , pedidos.taxamt			
            , pedidos.frete					
            , pedidos.totaldue	
            , pedidos.data_do_pedido				
            , pedidos.data_de_vencimento					
            , pedidos.data_de_envio	
            , pedidos.status				
            , pedidos.identificacao_do_cliente



        from pedidos
        left join  pedido_item on pedidos.pedido_id = pedido_item.pedido_id
        left join  motivo_venda on pedidos.pedido_id = motivo_venda.pedido_id
       

    )

select *
from joined

