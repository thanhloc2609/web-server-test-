FROM    ubuntu:latest
RUN     apt-get update -y
ENV     TZ=Asia/Ho_Chi_Minh
RUN     apt-get upgrade -y \
        && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
        && apt-get install apache2 -y 
RUN     mkdir my-code
WORKDIR my-code
COPY    /my-site .
COPY    ./my-site.conf /etc/apache2/sites-available/.
WORKDIR /etc/apache2/sites-available
RUN     a2dissite *
RUN     a2ensite my-site.conf
WORKDIR /etc/apache2
COPY    ./apache2.conf .
WORKDIR my-code
CMD     apachectl -D FOREGROUND
