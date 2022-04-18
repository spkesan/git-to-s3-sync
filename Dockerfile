FROM python:3.10-alpine

ARG AWS_CLI_VERSION='1.22.97'
ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}

RUN pip install --quiet --no-cache-dir awscli==${AWS_CLI_VERSION}

ADD run-sync.sh /run-sync.sh
RUN chmod +x /run-sync.sh

ENTRYPOINT ["/run-sync.sh"]
