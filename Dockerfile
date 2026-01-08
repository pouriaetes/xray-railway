FROM alpine:latest

# نصب ابزارهای لازم
RUN apk add --no-cache wget unzip ca-certificates

# دانلود و نصب دستی Xray
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/xray && \
    rm Xray-linux-64.zip

# کپی فایل کانفیگ
COPY config.json /etc/xray/config.json

# اجرای Xray
CMD ["/usr/local/bin/xray", "run", "-c", "/etc/xray/config.json"]
