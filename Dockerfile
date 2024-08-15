FROM ubuntu:latest

ENV TZ=Asia/Jerusalem 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 

RUN apt-get update && \
    apt-get install -y && \
    apache2 apache2-utils && \
    apt-get clean && \ 
    
RUN mkdir -p /var/www/html
COPY index.html /var/www/html

EXPOSE 80 
CMD ["apache2ctl", "-D", "FOREGROUND"]
