El Capitan OSX Vagrant port forwarding rules to use privileged ports 80 and 443
https://gist.github.com/radabass/8cc8a8554d9b4ccb85b545d1d84929f0

A second option may be use command line each time::

    echo "
    rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8088
    rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 8443
    " | sudo pfctl -ef -

To disable the forwarding::

    sudo pfctl -F all -f /etc/pf.conf

To display current forwarding rules::

    sudo pfctl -s nat


https://certbot.eff.org/docs/using.html#webroot

.. code-block:: bash

    sudo certbot certonly --standalone --preferred-challenges http-01 -d  www.example.com

    IMPORTANT NOTES:
    - Congratulations! Your certificate and chain have been saved at
    /etc/letsencrypt/live/caoba.matem.unam.mx/fullchain.pem. Your cert
    will expire on 2017-04-19. To obtain a new or tweaked version of
    this certificate in the future, simply run certbot again. To
    non-interactively renew *all* of your certificates, run "certbot
    renew"
    - If you like Certbot, please consider supporting our work by:

    Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
    Donating to EFF:                    https://eff.org/donate-le


/etc/letsencrypt/live/www.example.com/fullchain.pem

/etc/letsencrypt/live/www.example.com/privkey.pem


.. code-block:: bash

    # HTTPS server (Nginx)

    server {
        listen       443 ssl;
        server_name  localhost;

        ssl_certificate      /etc/letsencrypt/live/www.example.com/fullchain.pem;
        ssl_certificate_key  /etc/letsencrypt/live/www.example.com/privkey.pem;

        ssl_session_cache shared:SSL:1m;
        ssl_session_timeout  5m;

        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers   on;

        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
    }


Para renovar::

    $ sudo certbot renew --preferred-challenges http-01
    Congratulations, all renewals succeeded. The following certs have been renewed:
    /etc/letsencrypt/live/caoba.matem.unam.mx/fullchain.pem (success)