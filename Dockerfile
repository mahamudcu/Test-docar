#FROM ruby:3.1.1-alpine
#
#RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#
#RUN gem install bundler
#
#WORKDIR /app
#
#COPY . /app
#COPY Gemfile Gemfile.lock ./
#
#RUN bundle install
#EXPOSE 3000
#
#CMD rm -f tmp/pids/server.pid & rails s -b '0.0.0.0'


# syntax=docker/dockerfile:1
#FROM ruby:2.5
#RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#WORKDIR /myapp
#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
#RUN gem install bundler
#
## Finish establishing our Ruby environment
#RUN bundle install --full-index
#
## Add a script to be executed every time the container starts.
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000
#
## Configure the main process to run when running the image
#CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:2.7.0

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]