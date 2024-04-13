FROM ruby:3.2.3-slim
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR /rails
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential
