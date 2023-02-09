with
    produto as (
        select *
        from {{ ref('dim_produto') }}
    )

    , territorio as (
        select *
        from {{ ref('dim_territorio') }}
    )

    , pedido_itens as (
        select *
        from {{ ref('int_vendas__pedido_itens') }}
    )

    , motivo_venda as (
        select * 
        from {{ ref('dim_motivo_venda')}}
    )

    , cartao as (
        select * 
        from {{ ref('dim_cartao')}}
    )

    , salesorderheadersalesreason as (
        select * 
        from {{ ref('stg_erp__salesorderheadersalesreason')}}
    )


    , joined as (
        select
            pedido_itens.pedido_id
            , produto.sk_produto as fk_produto
            , cartao.sk_cartao as fk_cartao
            , motivo_venda.sk_motivo_venda as fk_motivo_venda
            , territorio.sk_territorio as fk_territorio
            , pedido_itens.detalhe_pedido_id	
            , pedido_itens.produto_id
            , pedido_itens.id_territorio 				
            , pedido_itens.id_cartao_credito
            , pedido_itens.endereco_id
            , pedido_itens.razao_venda_id						
            , pedido_itens.qnt_pedido				
            , pedido_itens.preco_unitario			
            , pedido_itens.desconto_preco_unitario
            , pedido_itens.subtotal			
            , pedido_itens.taxamt			
            , pedido_itens.frete					
            , pedido_itens.totaldue	
            , pedido_itens.data_do_pedido				
            , pedido_itens.data_de_vencimento					
            , pedido_itens.data_de_envio	
            , pedido_itens.status				
            , pedido_itens.identificacao_do_cliente
        
        from pedido_itens 
        left join produto on pedido_itens.produto_id = produto.produtos_id
        left join cartao on pedido_itens.id_cartao_credito = cartao.cartao_de_credito_id
        left join salesorderheadersalesreason on pedido_itens.pedido_id = salesorderheadersalesreason.pedido_id
        left join motivo_venda on salesorderheadersalesreason.razao_venda_id = motivo_venda.razao_venda_id
        left join territorio on pedido_itens.endereco_id  = territorio.endereco_id

    )

    , transformacoes as (
        select
            row_number() over (order by pedido_id) as sk_venda
            , *
            , case 
                when desconto_preco_unitario > 0 then 'Sim'
                when desconto_preco_unitario = 0 then 'Não'
                else 'Não'
                end as is_teve_desconto
            , case
                when  status = 1 then 'Em progresso'
                when  status = 2 then 'Aprovado'
                when  status = 3 then 'Em espera' 
                when  status = 4 then 'Rejeitado' 
                when  status = 5 then 'Enviado'
                when  status = 6 then 'Cancelado' 
                else 'Sem status'
                end as status_name
           , preco_unitario * qnt_pedido as total_bruto
           , (1 - desconto_preco_unitario) * preco_unitario * qnt_pedido as total_liquido
        from joined
    )

select *
from transformacoes