FROM ruby:3.4.13

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /src

COPY src/Gemfile src/Gemfile.lock ./

RUN bundle install

COPY src/ .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "--pid=/tmp/server.pid"] 