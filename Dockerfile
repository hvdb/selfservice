
# > docker build -t selfservice .
# > docker run -p 8888:80 -d selfservice


FROM nginx
MAINTAINER Henk vd Brink <henvandenbrink@gmail.com>

ADD build/web /usr/local/nginx/html
ADD web/main.dart /usr/local/nginx/html/main.dart

EXPOSE 80

