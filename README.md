# CodeSongs Microservice

## Description

Find the perfect song for your codebase with CodeSongs!

CodeSongs allows a user to select a GitHub repository and a musical artist and then "Songify" their code to find that artists best matching songs for the code. To do so CodeSongs uses IBM's Watson Tone Analyzer to identify the occurring sentiments in the code as well as in the selected artists top songs. CodeSongs then uses a proprietary algorithm to match the repo with the best suited songs.

This repository is for the CodeSongs Microservice. For the other part of CodeSongs see the [repository page on GitHub](https://github.com/BabsLabs/code_songs).

## Purpose

The purpose of this project was to practice OAuth, Database Design, Background Workers / Cron Tasks, and API calls, and to build a postgresql database with Sinatra.

## Focus Areas

* Consuming a number of various APIs
* Authenticated API calls
* Building features on Greenfield Code
* Building a Microservice
* Building a postgresql database in Sinatra
* Writing a cron task to automatically make API calls to seed and update database
* Test driven development
* Project planning
* Work with a deadline
* Prioritizing code functionality vs best practices

## APIs Used
* [GitHub API](https://developer.github.com/v3)
* [MusixMatch API](https://developer.musixmatch.com)
* [YouTube API](https://developers.google.com/youtube/v3)
* [Watson Tone Analyzer API](https://www.ibm.com/watson/services/tone-analyzer)

## Tech/Framework Used

The CodeSongs Microservice is written in Sinatra, uses a postgresql database, and is hosted on Heroku with the Travis CI integration tool.

### Gems
The following Ruby Gems are used in this project:

* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)
* [activerecord](https://github.com/rails/rails/tree/master/activerecord)
* [dotenv](https://github.com/motdotla/dotenv)
* [vcr](https://github.com/vcr/vcr)
* [webmock](https://github.com/bblimke/webmock)
* [shotgun](https://github.com/rtomayko/shotgun)
* [tux](https://github.com/cldwalker/tux)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [skylight](https://www.skylight.io/)

## Database

### Database Diagram
![Database Diagram](https://raw.githubusercontent.com/BabsLabs/code_songs_microservice/readme_bb/app/lib/images/Screen%20Shot%202020-01-09%20at%206.09.45%20PM.png)


### Database Setup

#### Local Environment:
  - `bundle exec rake db:create`
  - `bundle exec rake db:migrate`
  - `bundle exec rake db:seed`

#### Test Environment:
  - `RACK_ENV=test bundle exec rake db:{migrate,seed}`

### Running Tests:
  - You can run the full testing suite with the command `bundle exec rspec`

  - You can run an individual test using `bundle exec rspec <path-to-file>`

### Using Fiagro or DOTENV in development and testing:
Keep enviornment variables secure by using Figaro to generate an `appliation.yml` file or by saving a `.env` file in the root directory. See more information about using the figaro gem at or https://github.com/laserlemon/figaro the dotenv gem at https://github.com/bkeepers/.

### Required Environment Variables
Environment variables and required API keys/tokens (in Figaro format) :
1. YouTube API key defined as `ENV['YOUTUBE_API_TOKEN']`
1. GitHub Token defined as `ENV['GITHUB_TEST_TOKEN']`
1. MusixMatch Token defined as `ENV['MUSIX_MATCH_TOKEN']`
1. Watson Token defined as `ENV['MUSIX_MATCH_TOKEN']`
1. Watson Instance defined as `ENV['WATSON_INSTANCE']`

### Refreshing VCR Test Cassettes
From time to time you may receive an error when testing with the VCR. You can delete the cassettes directory from your `spec` folder and run `bundle exec rspec` to refresh the cassettes used. More information on VCR cassettes can be found in the [VCR documentation](https://github.com/vcr/vcr).

## Versions
- Ruby 2.4.1
- Rails 5.2.4