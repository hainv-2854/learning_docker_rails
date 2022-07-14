# Dockerfile
FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y build-essential
#RUN mkdir /demo_app_docker
WORKDIR /demo_app_docker
COPY . /demo_app_docker/

# ADD Gemfile /demo_app_docker/Gemfile
# ADD Gemfile.lock /demo_app_docker/Gemfile.lock
# RUN gem install bundler -v 2.1.4 -no-rdoc -no-ri
RUN bundle install

EXPOSE 3000

ADD . /demo_app_docker
CMD ["bundle", "exec", "pumactl", "start"]
