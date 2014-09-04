
# > docker build -t selfservice .
# > docker run -p 8889:80 -d selfservice

FROM nginx
MAINTAINER Henk vd Brink <hendrik.van.den.brink@ing.nl>

ADD build/web /usr/local/nginx/html

EXPOSE 80

