# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the dependency manifest and lockfile together
COPY Gemfile Gemfile.lock ./

# Install bundler and dependencies
ENV BUNDLE_FROZEN=true
RUN gem install bundler -v "$(tail -n 1 Gemfile.lock | tr -d '[:space:]')" && bundle install

# Command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-w", "--force_polling", "--config", "_config.yml,_config_docker.yml"]

