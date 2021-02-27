FROM alpine:latest
ENV TZ=Asia/Shanghai
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.11/main/" > /etc/apk/repositories

COPY clash /usr/local/bin/
COPY Country.mmdb /root/.config/clash/
COPY entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/clash

RUN apk add --no-cache \
    ca-certificates  \
    bash  \
    curl \
    iptables  \
    bash-doc  \
    bash-completion  && \
    rm -rf /var/cache/apk/* && \
    chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["clash"]
