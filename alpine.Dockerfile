# Set the base image to mysql
#FROM ubuntu:14.04
FROM alpine:latest
#
# # Add the zipped sql resources
# ADD /@archive.zip@ /
#
# add required applications
RUN apk add --update mysql mysql-client maven openjdk8\
    && rm -f /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH ${PATH}:/usr/lib/jvm/java-1.8-openjdk/bin

# Resouces
# unzip the archive
# RUN unzip /@archive.zip@ -d /tmp
# RUN chmod 755 /tmp/init_db.sh

# MYSQL
# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*
# make mysql reachable not only from localhost
RUN sed -i 's/^bind-address.*/bind-address=0.0.0.0/' /etc/mysql/my.cnf

#RUN cat /etc/mysql/my.cnf

#define access data
ENV DB_USER root
ENV DB_PASSWORD admin
ENV DB_NAME gtas
ENV VOLUME_HOME "/var/lib/mysql"

# open to mount
VOLUME ["/var/lib/mysql", "/var/log/mysql"]

# Expose the mysql server port
EXPOSE 3306

RUN mkdir -p /project

VOLUME gtas-parent /project
VOLUME C:\Users\GTAS7\.m2 /root/.m2
COPY gtas-parent /project
WORKDIR /project

RUN mvn clean install -D skip.unit.tests=true\
    && cd gtas-commons\
    && mvn hibernate4:export

# start container
CMD ["/bin/bash", "/tmp/init_db.sh"]
