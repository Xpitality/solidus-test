FROM ruby:2.7.2 as builder

RUN curl https://deb.nodesource.com/setup_12.x | bash \
    && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y \
            default-libmysqlclient-dev build-essential imagemagick yarn nodejs libnotify-dev \
    && rm -rf /var/lib/apt/lists/*

# This is where we build the rails app
FROM builder as rails-app

ARG APP_DIR=/solidus_test
WORKDIR $APP_DIR

COPY ["Gemfile*", "package.json", "yarn.lock", "$APP_DIR/"]

RUN yarn install --pure-lockfile

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v 2.1.4 \
    && bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
