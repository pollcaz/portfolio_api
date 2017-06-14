# README

# Zemoga Portfolio API

This Project allows to see a profile by default and when the user is loged in has the posibility
to edit its profile and text a twitter account to whatch the time line from twitter and use the endpoints
to get and update user information.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
* Ruby version
  Rbenv
  Ruby 2.4.1
  Rails 5.1.1

What things you need to install the software and how to install them

```
Imagemagick -> https://www.imagemagick.org/script/install-source.php 
```

### Installing
* Remove example extension from config/database.yml.example
* Set the right values in config/database.yml to enable the database conexion
* create the database and populate with a user to login in dev environment
```shell
1) bundle exec rake db:create
2) bundle exec rake db:reset db:setup
3) bundle exec rake db:migrate RAILS_ENV=test
```

Note: If data exist in db the seed don't replace information.

## Running the tests

You have two options, first is run rspec command like this
```shell
 $ rspec spec
```
the second is using guard, in the console execute the command and then press Enter key:
```ruby
$ cd app_name 
app_name $ guard
```

### Break down into end to end tests

The test covered were for the user and profile models and the endpoint from zemoga_portfolio_api
which are 
* user_info -> GET Request
* modify_user_info -> POST Request

Note: The endpoints are public for that reason not should pass a token for get a avalid request

suposed you are runing your app in development environment, a way to use the endpoint mentioned before is using curl:
```shell
$ curl -X GET 'http://localhost:3000/zemoga_portfolio_api/user_info?id=1'
$ curl -H "Content-Type: application/json" -X POST -d '{"id":"1","user_name":"Admin"}' http://localhost:3000/zemoga_portfolio_api/modify_user_info
```

## Author

* **Paulo Andrés Carmona** - *Initial work* - [pollcaz](https://github.com/pollcaz)

## License

This project is licensed under the MIT License

## Acknowledgments

* I hope this serves to someone who is waiting to get more knowledge about json api in rails
