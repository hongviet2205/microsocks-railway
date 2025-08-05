FROM alpine
RUN apk add --no-cache microsocks
CMD microsocks -1 -i 0.0.0.0 -p 1080

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
