# Dockerfile
FROM ruby:3.1.0
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /demo_app_docker

WORKDIR /demo_app_docker

# COPY . /demo_app_docker
# RUN gem install bundler && bundle install

#need to separate but why
ADD Gemfile /demo_app_docker/Gemfile
ADD Gemfile.lock /demo_app_docker/Gemfile.lock
RUN gem install bundler && bundle install

COPY . /demo_app_docker
#Redundant
# ADD . /demo_app_docker

EXPOSE 3000

# CMD ["bundle", "exec", "pumactl", "start"]
