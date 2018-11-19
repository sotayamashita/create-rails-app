FROM ruby:2.5

# Configure locals
ENV LANG C.UTF-8
# Set app name
ENV APP_ROOT /app

# For essential
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    gcc \
    g++ \
    make \
    nodejs \
    vim \
    wget \
 && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz \
 && tar -xvzf entrykit_0.4.0_Linux_x86_64.tgz \
 && rm entrykit_0.4.0_Linux_x86_64.tgz \
 && mv entrykit /bin/entrykit \
 && chmod +x /bin/entrykit \
 && entrykit --symlink

RUN mkdir -p ${APP_ROOT}

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
WORKDIR ${APP_ROOT}

ENTRYPOINT [ \
  "prehook", "ruby -v", "--", \
  "prehook", "node -v", "--", \
  "prehook", "npm  -v", "--", \
  "prehook", "bundle install -j3 --quiet --retry 5", "--" ]
