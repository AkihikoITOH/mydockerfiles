docker run -it \
  -p 80:8888 \
  -e "PASSWORD=password" \
  -e "USE_HTTP=1" \
  -e "BASE_URL=/" \
  -e "WEBSOCKET_URL=''" \
  akihikoitoh/jupyter:latest
