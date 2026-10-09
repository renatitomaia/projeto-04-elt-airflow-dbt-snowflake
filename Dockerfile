FROM apache/airflow:2.9.3

USER root
# Instala dependências de compilação essenciais para o conector Snowflake
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libssl-dev \
       libffi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Instala os providers do Airflow
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Cria um virtualenv isolado para o dbt-snowflake
RUN python -m venv /opt/airflow/dbt_venv \
    && /opt/airflow/dbt_venv/bin/pip install --no-cache-dir --upgrade pip \
    && /opt/airflow/dbt_venv/bin/pip install --no-cache-dir dbt-snowflake==1.8.3

# Adiciona o dbt_venv ao PATH para executar 'dbt' diretamente
ENV PATH="/opt/airflow/dbt_venv/bin:$PATH"