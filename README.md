# Create Rails App

## Installation

Clone:

```bash
$ git clone --depth=1 git@github.com:sotayamashita/create-rails-app.git
$ cd create-rails-app
```

Using Rails for following mode:

```bash
# Using Rails for normal:
$ docker-compose run --rm web rails new . --force --skip-bundle --skip-test --skip-yarn --skip-coffee --database=postgresql
$ cp -f templates/database.yml config/database.yml
$ docker-compose run --rm web rake db:create
```

or

```bash
# Using Rails for API-only:
$ docker-compose run --rm web rails new . --force --skip-bundle --skip-test --skip-yarn --api
$ rm templates/database.yml
```


## Miscellaneous

### How to find Ruby stable version

1. Go to https://www.ruby-lang.org/en/downloads/

### How to find Rails stable version

1. Go to https://github.com/rails/rails
1. Click "Switch branches/tags" and choose \*-stable
1. Look `version.rb`

    ```ruby
    # E.g. Branch:5-2-stable version.rb　(As of November 19)
    module VERSION
      MAJOR = 5
      MINOR = 2
      TINY  = 1
    ```

## License

Create Rails App © Sam Yamashita. Released under the [MIT](LICENSE)<br/>
Authored and maintained by Sam Yamashita with help from [contributors](https://github.com/sotayamashita/create-rails-app/contributors).
