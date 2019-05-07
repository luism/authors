# README

This application is only for an example.

Pre Requisites:
- Ruby 2.5.1
- MySQL 5.1
- Node 6.11.0
- npm 3.10.10

## API

To run the API app first install:

`gem install bundler`

After intall all dependencies:

`bundle install`

Edit `config/database.yml` with your credentials

Run:

```
$ rake db:create
$ rake db:schema:load
$ rake db:seed
```

Server run `$ rails s`

Tests: To run testst: `$ rspec`

To run the application in production you shoul need to set some environments variables:
```
AUTHORS_DATABASE=
AUTHORS_DATABASE_USERNAME=
AUTHORS_DATABASE_PASSWORD=
```

## Front-End

Fist run `npm install`

To run the server `npm start`

... To Do.