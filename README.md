# Facemash

Facemash is a clone of some of the core features of facebook which includes; users, profiles, “friending”, posts, news feed, and “liking”. 

![facemash2](https://user-images.githubusercontent.com/21004010/65952202-6fb65580-e439-11e9-9868-af236f1205fe.png)

### [Live version](https://shrouded-refuge-15460.herokuapp.com)

## Features
- Authentication:
  * User signup and login with username and password.
  * User can signup and login with Facebook Oauth
- Manage User resources with basic functionalities:
  * Users can send, accept, cancel and reject friend requests
  * Users can unfriend other users
  * Users can create, edit and delete posts and comment on posts.
  * Editing and deleting comments.
  * Liking and Unliking posts.
- Flash messages responding to users' interaction with the app
- Showing Like count
- Responsive web design.


## Technologies

Ruby 2.6.0

Postgresql 1.1.4

## Framework

Ruby on Rails 5.2.3

Bootstrap

## Getting started

### Clone the repository

```shell
$ git clone https://github.com/kvnlay/facemash
cd facemash
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 2.6.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.6.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install --without production
```

### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):

Add Figaro to your Gemfile and `bundle install`:

This creates a commented `config/application.yml` file and adds it to your
`.gitignore`. Add your own configuration to this file and you're done!

```shell
add Postgresql username and password to `config/application.yml` with the following variable names:
username: POSTGRES_USER
password: POSTGRES_PASSWORD
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```
### Testing

Simply run

```ruby
rspec
```
## Contributors

[Musa Jabbaaru Ntege](https://github.com/Cena-JM)<br>
[Kingsley Omotayo](https://github.com/kvnlay)

