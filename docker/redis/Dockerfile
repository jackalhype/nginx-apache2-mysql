FROM redis

COPY redis.conf /usr/local/etc/redis/redis.conf

RUN apt-get update && apt-get install -y \
    net-tools htop less nano

RUN touch /var/log/redis-server.log \
    && chmod 0777 /var/log/redis-server.log

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

EXPOSE 6379
