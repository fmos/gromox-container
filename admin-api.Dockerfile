FROM olam1k0/grommunio:latest

RUN apt-get update && apt-get -y install grommunio-admin-api grommunio-admin-web

COPY ./config_files/admin_api_supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./config_files/admin_api_db.yaml /etc/grommunio-admin-api/conf.d/database.yaml

RUN chown root:gromox /etc/gromox

RUN chmod 775 /etc/gromox

RUN ln -s /etc/grommunio-common/nginx/ssl_certificate.conf /etc/grommunio-admin-common/nginx-ssl.conf

EXPOSE 5001

ENTRYPOINT ["/usr/bin/supervisord"]

# Don't forget to start php-fpm in supervisor file
