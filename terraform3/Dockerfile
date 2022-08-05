# Dockerfile
FROM ubuntu:latest
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install apache2 -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install php -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install curl
COPY index.html /var/www/html/
# Install apache and write hello world message
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf
RUN echo '<VirtualHost *:80>' > /etc/apache2/sites-available/000-default.conf && \
 echo 'ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'DocumentRoot /var/www/html' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'RewriteEngine On' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'RewriteCond %{REQUEST_FILENAME} !-f' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'RewriteCond %{REQUEST_FILENAME} !-d' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'RewriteRule . /index.html [L]' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'ErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/000-default.conf && \
 echo 'CustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/000-default.conf && \
 echo '</VirtualHost>' >> /etc/apache2/sites-available/000-default.conf
# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh
RUN a2enmod rewrite
CMD apachectl -D FOREGROUND
EXPOSE 80