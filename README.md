# ❄️ Modern Data Stack: Orquestração ELT com Airflow, dbt e Snowflake

## 📌 Sobre o Projeto
Pipeline corporativo de Engenharia de Dados construído com a *Modern Data Stack*. O projeto orquestra a ingestão e transformação de dados transacionais, utilizando **Apache Airflow** (conteinerizado via Docker) para o agendamento, **dbt Core** para modelagem analítica e testes de qualidade, e **Snowflake** como Data Warehouse.

## 🏗️ Arquitetura da Solução
1. **Extração e Carga (EL):** O Airflow orquestra a carga dos arquivos transacionais brutos diretamente para a camada `RAW` no Snowflake utilizando recursos nativos do dbt.
2. **Transformação (T):** O dbt Core processa os dados no Data Warehouse construindo as camadas `Staging` (limpeza e padronização de tipos) e `Marts` (cálculo de métricas de negócio e estrutura Star Schema).
3. **Governança e Qualidade:** Testes automatizados do dbt avaliam a integridade referencial, unicidade e ausência de nulos antes de disponibilizar as tabelas finais.

## 🛠️ Stack Tecnológica
* **Orquestração:** Apache Airflow
* **Transformação & Testes:** dbt Core (dbt-snowflake)
* **Data Warehouse:** Snowflake
* **Infraestrutura:** Docker & Docker Compose

## 🚀 Como Reproduzir o Projeto
1. Clone este repositório.
2. Configure suas credenciais do Snowflake no arquivo `dbt_project/profiles.yml`.
3. Crie um arquivo `.env` na raiz do projeto com o conteúdo: `AIRFLOW_UID=50000`.
4. Suba a infraestrutura executando:
   ```bash
   docker compose up -d