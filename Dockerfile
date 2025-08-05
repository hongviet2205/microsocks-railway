FROM alpine:latest
RUN apk add --no-cache microsocks
ENV PROXY_USER=proxytest
ENV PROXY_PASS=123456
ENV PORT=1080
CMD microsocks -p $PORT -u $PROXY_USER -P $PROXY_PASS
