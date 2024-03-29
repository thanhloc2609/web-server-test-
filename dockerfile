FROM    ubuntu:latest
RUN     apt-get update -y
ENV     TZ=Asia/Ho_Chi_Minh
RUN     apt-get upgrade -y \
        && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
        && apt-get install apache2 -y 
RUN     mkdir my-code
COPY    ./my-site.conf /etc/apache2/sites-available/.
COPY    ./apache2.conf /etc/apache2/.
WORKDIR /etc/apache2/sites-available
RUN     a2dissite *
RUN     a2ensite my-site.conf
CMD     apachectl -D FOREGROUND
