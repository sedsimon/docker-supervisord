FROM sedsimon/supervisord:latest

MAINTAINER Simon Stanlake <simon.stanlake@gmail.com>

# have to overwrite default supervisord.conf to remove nodaemon=true
ADD supervisor.conf /etc/supervisor.conf

# install ngrok
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ngrok-client

ADD ngrok.sv.conf /etc/supervisor/conf.d/

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
RUN DEBIAN_FRONTEND=noninteractive npm install -g nodemon

ADD package.json  /etc/hipchat/addon/
ADD README.md  /etc/hipchat/addon/
ADD web.js  /etc/hipchat/addon/

WORKDIR /etc/hipchat/addon/

RUN npm install

ADD init.sh /tmp/init.sh
RUN chmod 700 /tmp/init.sh

CMD ["/tmp/init.sh"]

