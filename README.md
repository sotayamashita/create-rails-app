# Create Rails App

## Installation



Normal mode:

```bash
git clone git@github.com:sotayamashita/create-rails-app.git
cd create-rails-app
docker-compose run --rm web rails new . -d postgresql --skip-coffee -T -B -f
cp -f template/database.yml config/database.yml
docker-compose run web rake db:create
```

```
docker-compose run --rm web rails new . --force --skip-bundle --skip-test --skip-yarn --skip-coffee --database=postgresql
```

API mode:

```
docker-compose run --rm web rails new . --force --skip-bundle --skip-test --skip-yarn --api
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
