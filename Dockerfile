FROM ruby:2.6.5-alpine

RUN apk add --no-cache \
    build-base \
    linux-headers \
    tzdata \
    postgresql-dev

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]