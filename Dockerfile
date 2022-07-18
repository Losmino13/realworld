FROM ubuntu:latest

LABEL maintainer="mmilisav"

WORKDIR /app

ENV PATH=/app/realworld:${PATH}

SHELL ["/bin/bash", "-c"] 

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install \
    python3-pip \
    python3-venv \
    mysql-client \
    git

RUN git clone https://github.com/Losmino13/realworld.git

RUN cd /app/realworld && \
    python3 -m venv conduit && \
    ls -ltr && \
    source conduit/bin/activate && \
    pip install -r requirements.txt && \
    ./manage.py migrate

RUN ls -ltr && \
    chmod 755 realworld/start_server.sh

EXPOSE 8000

CMD start_server.sh
