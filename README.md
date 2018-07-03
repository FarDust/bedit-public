# README

## Heroku
https://bedit.herokuapp.com/

## Development setup

* Add file `.env` to root folder
* `docker-compose build`
* `docker-compose run web bundle install`
* `docker-compose run web bin/yarn`
* `docker-compose run web rake db:setup`

## Env file

* .env file must have this variables:

```
CLOUDINARY_CLOUD=<secret>
CLOUDINARY_KEY=<secret>
CLOUDINARY_SECRET=<secret>
GOOGLE_CLIENT_ID=<secret>
GOOGLE_CLIENT_SECRET=<secret>
```

## Mount application

* `docker-compose run --service-ports web`
* Open `localhost:3000` with any browser
