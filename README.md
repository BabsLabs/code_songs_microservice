Code Songs Microservice

Database Setup
Local Environment:
  - `bundle exec rake db:create`
  - `bundle exec rake db:migrate`
  - `bundle exec rake db:seed`
Test Environment:
  - `RACK_ENV=test bundle exec rake db:{migrate,seed}`

Run Tests:
  - `bundle exec rspec`

Using DOTENV in development and testing:
Keep enviornment variables secure by saving a `.env` file in the root directory. See more information about using dotenv gem at https://github.com/bkeepers/dotenv
