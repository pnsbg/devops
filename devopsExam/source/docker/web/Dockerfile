FROM centos:latest
MAINTAINER Peter Tsonkov

# Install HTTPD, PHP, and supplimentary programs. openssh-server, curl, and lynx-cur are for debugging the container.
RUN yum upgrade -y
RUN yum install -y httpd php php-cli php-common php-mysql curl lynx openssh-server net-tools mlocate

# Enable apache mods.
# RUN a2enmod php7.0
# RUN a2enmod rewrite

# Update the PHP.ini file, enable <? ?> tags and quieten logging.
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php.ini

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/httpd
ENV APACHE_LOCK_DIR /var/lock/httpd
ENV APACHE_PID_FILE /var/run/httpd.pid

# Expose apache.
EXPOSE 80

# Copy this repo into place.
ADD www /var/www/html

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD /usr/sbin/httpd -D FOREGROUND