FROM ubuntu

ENV TZ=Asia/Jerusalem 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 

RUN apt update && apt install apache2 -y && apt install apache2-utils -y && apt clean 

RUN mkdir -p /var/www/html
COPY index.html /var/www/html

EXPOSE 80 
CMD ["apache2ctl", "-D", "FOREGROUND"]
