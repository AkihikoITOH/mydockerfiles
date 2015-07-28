FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -yq --no-install-recommends awscli groff-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp

RUN mkdir -p /root/.aws 
COPY ["./config.production", "/root/.aws/config"]

