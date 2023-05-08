FROM fedora:36

# Set image locale.
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Europe/Athens

# Expose port 80 by default
EXPOSE 80

STOPSIGNAL SIGQUIT

#RUN localectl set-locale LANG=en_US.UTF-8

# system update
RUN ["dnf", "update", "-y"]

# install needed packages
RUN dnf install -y nginx

# configure nginx
COPY src/html /usr/share/nginx/html
COPY nginx.conf /usr/local/nginx/conf/

# Ensure nginx runs endlessly
CMD ["nginx","-g", "daemon off;"]