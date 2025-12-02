FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR ./src

COPY ./src/Gemfile ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
