# CodeSongs Microservice

## Description

Find the perfect song for your code with CodeSongs! CodeSongs is a Ruby On Rails powered frontend that allows a user to select a GitHub repository and a musical artist and then "Songify" their code to find that artists best matching songs for the code. To do so CodeSongs uses IBM's Watson Tone Analyzer to identify the occurring sentiments in the code as well as in the selected artists top songs. CodeSongs then uses a proprietary algorithm to match the repo with the songs.

## Database Setup
### Local Environment:
  - `bundle exec rake db:create`
  - `bundle exec rake db:migrate`
  - `bundle exec rake db:seed`
### Test Environment:
  - `RACK_ENV=test bundle exec rake db:{migrate,seed}`

## Running Tests:
  - `bundle exec rspec`

## Using Fiagro or DOTENV in development and testing:
Keep enviornment variables secure by using Figaro to generate an `appliation.yml` file or by saving a `.env` file in the root directory. See more information about using the figaro gem at or https://github.com/laserlemon/figaro the dotenv gem at https://github.com/bkeepers/.
