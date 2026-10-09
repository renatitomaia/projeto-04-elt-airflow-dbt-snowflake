from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'renatomaia',
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

DBT_DIR = '/opt/airflow/dbt_project'

with DAG(
    'elt_dbt_snowflake_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    start_date=datetime(2026, 1, 1),
    catchup=False,
    tags=['elt', 'dbt', 'snowflake'],
) as dag:

    # 1. Ingestão: Carrega o CSV no Snowflake
    dbt_seed = BashOperator(
        task_id='dbt_seed_raw_data',
        bash_command=f'cd {DBT_DIR} && dbt seed --profiles-dir .',
    )

    # 2. Transformação: Executa stg_vendas e fct_vendas
    dbt_run = BashOperator(
        task_id='dbt_run_transformations',
        bash_command=f'cd {DBT_DIR} && dbt run --profiles-dir .',
    )

    # 3. Qualidade: Executa testes de integridade
    dbt_test = BashOperator(
        task_id='dbt_test_data_quality',
        bash_command=f'cd {DBT_DIR} && dbt test --profiles-dir .',
    )

    # Define a ordem de execução
    dbt_seed >> dbt_run >> dbt_test