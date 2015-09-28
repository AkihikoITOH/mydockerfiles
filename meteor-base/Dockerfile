# Base for meteor projects
FROM debian:jessie
MAINTAINER ITOH Akihiko

RUN apt-get update

# Install git, curl, python
RUN apt-get install -y git curl python

# Install latest Node from nodesource
RUN curl https://deb.nodesource.com/setup | sh
RUN apt-get install -y nodejs

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Make sure we have a directory for the application
RUN mkdir -p /var/www
RUN chown -R www-data:www-data /var/www

# Install Meteor
RUN curl https://install.meteor.com/ | sh

EXPOSE 3000
