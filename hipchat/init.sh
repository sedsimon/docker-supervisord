#!/bin/dash

# start supervisor and ngrok
supervisord -c /etc/supervisor.conf

export DEV_KEY=icy-mountain-8208
export LOCAL_BASE_URL=$(cat /var/log/ngrok.log  | grep "Tunnel established" | tail -1 | sed 's/.*Tunnel established at //g')
echo "\nTunnel established at ${LOCAL_BASE_URL}\n"

if [ -d /src/addon/ ];
then
    echo "Copying custom code"
    cp -R /src/addon/* ./
fi

npm run web-dev

