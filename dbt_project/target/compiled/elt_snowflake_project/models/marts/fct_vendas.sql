

WITH staging AS (
    SELECT * FROM ELT_DATABASE.ANALYTICS.stg_vendas
)

SELECT
    id_transacao,
    data_venda,
    id_cliente,
    categoria,
    quantidade_comprada,
    valor_unitario,
    (quantidade_comprada * valor_unitario) AS receita_total
FROM staging