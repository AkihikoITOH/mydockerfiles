docker run -it \
  -p 443:443 \
  -e "PASSWORD=password" \
  -e "USE_HTTP=0" \
  -e "BASE_URL=/" \
  -e "WEBSOCKET_URL=''" \
  akihikoitoh/jupyter:latest
