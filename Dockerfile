FROM ruby:3.1.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Run the database migrations and seeds
RUN bundle exec rails db:migrate
RUN bundle exec rails db:seed

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
