#!/usr/bin/env sh

PWD=$(pwd)

mkdir -p $PWD/notebooks

docker run -idt \
  --name jupyter \
  -p 80:8888 \
  -e "PASSWORD=password" \
  -e "USE_HTTP=1" \
  -e "BASE_URL=/" \
  -e "WEBSOCKET_URL=''" \
  -v $PWD/notebooks:/notebooks \
  akihikoitoh/jupyter:latest
