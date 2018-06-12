FROM alpine

ENV SAM_CLI_VERSION=0.3.0 \
    PYTHONUSERBASE=/usr/local

RUN apk add --no-cache py-pip git bash && \
    pip install --user aws-sam-cli==${SAM_CLI_VERSION} awscli

WORKDIR /var/opt
COPY . /var/opt/

EXPOSE 3000
