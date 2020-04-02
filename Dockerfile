ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}

ENV LANG C.UTF-8
ENV ROOT /usr/src/app
ARG BUNDLER_VERSION

COPY Apkfile /tmp/Apkfile
RUN apk update -qq \
    # Updated and used on-the-fly and not cached locally
    # See: https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md#disabling-cache
    && apk add --no-cache build-base $(cat /tmp/Apkfile | xargs) \
    # Prevent bundler warnings `ensure that the bundler version executed is >= that which created Gemfile.lock`
    && gem update --system && gem install bundler:${BUNDLER_VERSION}

# Define working directory
WORKDIR ${ROOT}

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
