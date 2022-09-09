#!/bin/bash


# wait for airflow-db to be ready
until airflow db init; do
    echo "airflow-db not ready, sleeping 10 secs ..."
    sleep 10
done
echo "airflow-db is ready!"

## Set envvars (only required for docker)
airflow variables set TMP_CSV_DIR "/tmp/"
airflow variables set DAGS_CUSTOM_PARAMS '{}'

## Set connections (only required for docker)
echo "Adding connections ..."
airflow connections add \
    --conn-uri $DATAOPS_AIRFLOW_CONN_NYT_URI \
    nyt


## Start scheduler
airflow scheduler