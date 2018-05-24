FROM mariadb

MAINTAINER Sarel Janse van Rensburg <monstersarel@gmail.com>

ADD mariadb.init.sql /docker-entrypoint-initdb.d/aggregate.sql

ENV MYSQL_ROOT_PASSWORD=sqlAdmin 
ENV MYSQL_DATABASE=jboss_ops_stage 
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=admin

EXPOSE 3306 