FROM kong:2.5
USER root
RUN apk update && apk add git unzip luarocks
RUN luarocks install kong-jwt2header
RUN luarocks install kong-plugin-url-replace
#WORKDIR /usr/local/share/lua/5.1/kong/plugins/
ENV KONG_PLUGINS="bundled,kong-jwt2header,url-replace"
USER kong