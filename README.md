# create-rails-app

## Prerequisites

- Docker:whale2:: https://docs.docker.com/install/

## Build

Clone a project:

```bash
git clone --depth 1 git@github.com:startup-kit/create-rails-app.git
cd create-rails-app
```

Build a image:

```bash
docker-compose run app rails new . --force --no-deps --database=postgresql --skip-yarn --skip-coffee --skip-javascript --skip-test --skip-bundle
```

Rebuild the image again because of new Gemfile:

```bash
docker-compose build
```

Edit `config/database.yml` to connect:

```bash
sed -i -e '1,/default:\  &default/ s/encoding:.*$/encoding:\ utf8/g' config/database.yml
sed -i -e '1,/default:\  &default/ s/encoding:.*/& \n\ \ host:\ db\n\ \ username:\ postgres\n\ \ password:/g' config/database.yml
```

Boot the app with `docker-compose up`:

```bash
docker-compose up
```

Finally, you need to create the database. In another terminal, run:

```bash
docker-compose run app rake db:create
```

## License

create-rails-app © [Sam Yamashita](https://twitter.com/sota0805). Released under the [MIT](LICENSE)<br/>
Authored and maintained by [Sam Yamashita](https://twitter.com/sota0805) with help from [contributors](https://github.com/startup-kit/create-rails-app/contributors).
