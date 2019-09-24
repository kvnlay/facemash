# Facemash

Facemash is a clone of some of the core features of facebook which includes; users, profiles, “friending”, posts, news feed, and “liking”. 

### [Live version](https://shrouded-refuge-15460.herokuapp.com)

## Contributors

[Musa Jabbaaru Ntege](https://github.com/Cena-JM)<br>
[Kingsley Omotayo](https://github.com/kvnlay)

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
