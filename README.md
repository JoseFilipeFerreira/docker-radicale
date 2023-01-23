# :calendar: docker-radicale

docker container for [radicale](https://radicale.org/v3.html)

## docker-compose.yml

```yml
radicale:
  image: josefilipeferreira/docker-radicale:master
  container_name: radicale
  ports:
    - "5232:5232"
  volumes:
    # add git versioning to calendar database
    # - ~/.gitconfig:/etc/gitconfig
    - ./radicale/users:/users
    - ./radicale/collections:/collections
    - ./radicale/config:/config
  restart: unless-stopped
```

## example config

```ini
[auth]
type = htpasswd
htpasswd_filename = /users
htpasswd_encryption = md5
delay=1

[server]
hosts = 0.0.0.0:5232, [::]:5232
max_connections = 5
max_content_length = 100000000

[storage]
filesystem_folder = /collections
hook = git add -A && (git diff --cached --quiet || git commit -m "Changes by "%(user)s)
```
