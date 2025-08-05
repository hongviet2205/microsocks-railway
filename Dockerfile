FROM alpine:latest

# Cài đặt công cụ cần thiết để build microsocks
RUN apk add --no-cache build-base git

# Clone mã nguồn microsocks
RUN git clone https://github.com/rofl0r/microsocks.git /opt/microsocks

# Di chuyển vào thư mục và build
WORKDIR /opt/microsocks
RUN make

# Thiết lập cổng chạy SOCKS5
EXPOSE 1080

# Biến môi trường (nếu cần đặt user/pass)
ENV USER=
ENV PASS=

# Lệnh chạy microsocks, hỗ trợ user/pass nếu có
CMD ["/bin/sh", "-c", "./microsocks -p 1080 ${USER:+-u $USER} ${PASS:+-P $PASS}"]
