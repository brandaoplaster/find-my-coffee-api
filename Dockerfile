FROM ruby:2.6.6

# Install the dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick

# Install the GNUPG
RUN apt-get install -y gnupg curl gcc make proj-bin libgeos-dev libxml2 libjson-c-dev gdal-bin postgis

# Install NodeJS v12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs


# Set the path
ENV INSTALL_PATH /find-my-coffee-api

# Create directory
RUN mkdir -p $INSTALL_PATH

# Set path to main directory
WORKDIR $INSTALL_PATH

# Copy Gemfile into conteiner
COPY Gemfile ./

# Set the path for Gems
ENV BUNDLE_PATH /box

# Copy code into conteiner
COPY . .