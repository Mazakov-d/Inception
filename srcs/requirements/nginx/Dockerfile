FROM debian:bullseye

RUN apt update;\
    apt upgrade;\
    apt install nginx -y;\
    apt install openssl -y

WORKDIR /app
    
RUN openssl genrsa -out server.key 2048 \
    && openssl req -new -x509 -key server.key -out server.crt -days 365 -subj "/CN=localhost"
    
COPY tools/ .

COPY conf/nginx.conf /etc/nginx/

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]