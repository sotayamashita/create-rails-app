FROM ruby:2.6.1-alpine3.8

ENV LANG C.UTF-8
ENV APP_ROOT /app

RUN curl -sSL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get update -qq && apt-get install -y nodejs postgresql-client vim

RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}

COPY Gemfile* ${APP_ROOT}/
RUN bundle install -j "$(getconf _NPROCESSORS_ONLN)" --retry 5 \
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add a script to be executed every time the container starts.
COPY rootfs/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
