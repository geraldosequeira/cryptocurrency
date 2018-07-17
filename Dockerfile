FROM ruby:2.5.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install dependency
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# sets path
ENV INSTALL_PATH /cryptocurrencyexchange

# criate directory
RUN mkdir -p $INSTALL_PATH

# sets principal directory path
WORKDIR $INSTALL_PATH

# sets path for Gems
ENV BUNDLE_PATH /gems

# copy for container
COPY . .