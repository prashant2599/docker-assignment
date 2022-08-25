FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /dockerproject
WORKDIR /dockerproject
COPY Gemfile /dockerproject/Gemfile
COPY Gemfile.lock /dockerproject/Gemfile.lock
RUN bundle install
COPY . /dockerproject

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

