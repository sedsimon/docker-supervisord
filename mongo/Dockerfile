FROM sedsimon/supervisord:latest

MAINTAINER Simon Stanlake <simon.stanlake@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org

RUN mkdir -p /data/db

EXPOSE 27017

ADD mongo.sv.conf /etc/supervisor/conf.d/

