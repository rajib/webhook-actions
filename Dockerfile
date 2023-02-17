FROM ruby:3.0.3
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs redis
ENV BUNDLER_VERSION='2.2.32'
RUN gem install bundler --no-document -v '2.2.32'
RUN mkdir /src
WORKDIR /src
COPY Gemfile Gemfile.lock ./
COPY . ./
RUN bundle install
RUN apt-get update
RUN chmod 777 ./entrypoint.sh
CMD ./entrypoint.sh
RUN bash