#Dockerfile con APACHE
FROM ubuntu:latest
MAINTAINER jmalvido <jmalvido@egibide.org>
RUN apt-get update -y
RUN apt-get install -y apache2
WORKDIR /var/www/html
ENV DEBUG=True
#Apache utiliza el puerto 80
EXPOSE 80
VOLUME /data
#Tenemos una carpeta con los archivos html en el mismo lugar que el dockerfile
#El . se refiere a /var/www/html (Lo he definido en WORKDIR)

COPY ./index.html .
#RUN service apache2 start
CMD ["apachectl", "-D", "FOREGROUND"]

#EN POWERSHELL
#docker run -ti -d -p 80:80 jaime/apache
