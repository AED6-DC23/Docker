FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv nginx postgresql postgresql-contrib sudo gcc libpq-dev && \
    apt-get clean

COPY ./app /app
COPY requirements.txt /app/
COPY nginx.conf /etc/nginx/sites-available/default
COPY entrypoint.sh /entrypoint.sh
COPY init_db.sql /init_db.sql

RUN pip3 install --upgrade pip && pip3 install -r /app/requirements.txt

RUN chmod +x /entrypoint.sh

EXPOSE 80
EXPOSE 5432

ENTRYPOINT ["/entrypoint.sh"]