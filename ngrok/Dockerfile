FROM sedsimon/supervisord:latest

MAINTAINER Simon Stanlake <simon.stanlake@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y ngrok-client

ADD ngrok.sv.conf /etc/supervisor/conf.d/

CMD ["supervisord","-c","/etc/supervisor.conf"]

