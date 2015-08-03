FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -yq --no-install-recommends python python-pip groff-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN pip install awscli

RUN mkdir -p /root/.aws 
RUN mkdir -p /tmp

COPY ["./config.production", "/root/.aws/config"]
COPY ["./credentials.production", "/root/.aws/credentials"]

