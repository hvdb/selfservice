
# > docker build -t selfservice .
# > docker run -p 8888:80 -d selfservice


FROM nginx
MAINTAINER Henk vd Brink <henkvandenbrink@gmail.com>


COPY build/web /usr/share/nginx/html
COPY web/main.dart /usr/share/nginx/html/main.dart



EXPOSE 80

