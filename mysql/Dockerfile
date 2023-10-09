FROM mysql:8.0.21

COPY ./my.cnf /etc/mysql/conf.d/my.cnf
COPY ./script /docker-entrypoint-initdb.d/
