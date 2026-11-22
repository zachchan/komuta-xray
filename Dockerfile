FROM alpine:3.19
RUN apk add --no-cache ca-certificates curl unzip && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v25.11.8/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip && apk del curl unzip
COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
