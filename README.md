# TV Schedule

Simple tv schedule API

[DEMO](https://secret-taiga-43471.herokuapp.com)
[DOCS](http://docs.tvschedule.apiary.io/)

## Set up the app

    $ bundle install
    $ rails db:create db:migrate
    $ rails server

## Seed database
  $ rails db:seed

## Set up your Docker environment

  Before running docker change config/database.yml

  In development, set:

  ```
  host: db
  user: postgres
  ```

## Start the app

    $ docker-compose up web

## Bootstrap Data

    $ docker-compose run web rake db:bootstrap

## Run Tests

    $ docker-compose run web rake
