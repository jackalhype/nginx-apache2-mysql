FROM mysql:8.0.22

RUN touch /var/log/mysql-slow.log && chmod 0777 /var/log/mysql-slow.log
RUN touch /var/log/mysql-error.log && chmod 0777 /var/log/mysql-error.log

ADD my.cnf /etc/mysql/conf.d/my.cnf

RUN set -x && apt-get update && apt-get install -y net-tools

EXPOSE 3306