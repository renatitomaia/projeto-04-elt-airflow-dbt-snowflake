{{ config(materialized='view') }}

WITH raw_data AS (
    SELECT * FROM {{ ref('raw_vendas') }}
)

SELECT
    CAST(id_transacao AS INT) AS id_transacao,
    CAST(data_venda AS DATE) AS data_venda,
    CAST(id_cliente AS INT) AS id_cliente,
    UPPER(produto) AS nome_produto,
    categoria,
    CAST(qtd AS INT) AS quantidade_comprada,
    CAST(valor_unit AS DECIMAL(10,2)) AS valor_unitario
FROM raw_data
WHERE valor_unit > 0