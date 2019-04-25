FROM ruby:2.6.2-alpine
RUN apk update && apk add nodejs postgresql-dev build-base patch ruby-dev zlib-dev xz-libs dos2unix
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN dos2unix /usr/bin/entrypoint.sh
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]