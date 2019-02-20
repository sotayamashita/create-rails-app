

```
docker-compose run web rails new . --force --skip-bundle --skip-yarn --skip-coffee --no-deps --database=postgresql
docker-compose build
```

## Deployment

### on Elastic Beanstalk (web tier)

**Database connection**

https://docs.aws.amazon.com/ja_jp/elasticbeanstalk/latest/dg/AWSHowTo.RDS.html


---


# create-rails-app

## Execute commands in services

The general structure of the `exec` command is:

```bash
$ docker-compose exec <service> <command>
```

`<service>` is the name of the container service as described in the `docker-compose.yml` file and `<command>` is the command you want to launch inside the service.

## Run with other services

### Sidekiq

```diff
version: '3'
services:
  ...
+  redis:
+    image: redis:5.0-alpine
+    restart: always
+    volumes:
+      - ./tmp/srv/app/redis:/var/lib/redis

+  worker:
+    build: .
+    restart: always
+    command: bundle exec sidekiq -C config/sidekiq.yml -e development
+    volumnes:
+      - .:/app
+    depends_on:
+      - db
+      - redis
+    environment:
+      - REDIS_URL=redis://redis:6379
```

## References

- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Docker development best practices](https://docs.docker.com/develop/dev-best-practices/)
- [ShellCheck](https://www.shellcheck.net/)

## License

Create Rails App © Sam Yamashita. Released under the [MIT](LICENSE)<br/>
Authored and maintained by Sam Yamashita with help from [contributors](https://github.com/sotayamashita/create-rails-app/contributors).
