# README


### Heroku
https://grupo-21.herokuapp.com/


#### Development setup

* Add file `.env` to root folder
* `docker-compose build`
* `docker-compose run web bundle install`
* `docker-compose run web bin/yarn`
* `docker-compose run web rake db:setup`

#### Mount application
* `docker-compose run --service-ports web`
* Open `localhost:3000` with any browser
