FROM mysql:5.7.22

ADD mysql /etc/mysql

ENV TZ=Asia/Tokyo

RUN apt-get update && \
    apt-get install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

RUN { \
    echo '[mysqld]'; \
    echo 'character-set-server = utf8'; \
    echo 'collation-server = utf8_general_ci'; \
    echo '[client]'; \
    echo 'default-character-set = utf8'; \
} > /etc/mysql/conf.d/charset.cnf

RUN echo 'default-character-set = utf8' >> /etc/mysql/conf.d/mysql.cnf

ADD init.sql /docker-entrypoint-initdb.d/
