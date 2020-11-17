FROM debian:buster-slim

ARG RUNNER_VERSION=2.274.2
ENV RUNNER_NAME=""
ENV GIT_URL=""
ENV GIT_TOKEN=""


RUN apt-get update && \
    apt-get install -y \
        curl \
        unzip \
        ca-certificates \
        && apt-get clean

RUN mkdir -p /home/runner
WORKDIR /home/runner

RUN curl -L -O https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar -zxf actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && rm -f actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && ./bin/installdependencies.sh \
    && chown -R root: /home/runner \
    && apt-get clean

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]

