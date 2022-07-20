# Dockerfile
FROM ruby:3.1.0
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /demo_app_docker

WORKDIR /demo_app_docker
COPY . /demo_app_docker/

ADD Gemfile /demo_app_docker/Gemfile
ADD Gemfile.lock /demo_app_docker/Gemfile.lock

# RUN gem install bundler -v 2.1.4 -no-rdoc -no-ri
RUN bundle install
ADD . /demo_app_docker

EXPOSE 3000

# CMD ["bundle", "exec", "pumactl", "start"]
