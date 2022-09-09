FROM python:3.7.9 as airflow-builder

RUN apt-get update
RUN apt-get install curl libpq-dev libmariadb-dev-compat jq freetds-dev chromium-driver -y

RUN python -m pip install --upgrade pip
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY docker-entry.sh /docker-entry.sh