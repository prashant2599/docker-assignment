FROM ruby

ENV INSTALL_PATH /opt/app
RUN  mkdir -p $INSTALL_PATH

RUN gem install rails bundler

WORKDIR /opt/app

CMD ["/bin/sh"]

