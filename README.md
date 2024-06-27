# :calendar: docker-radicale

docker container for [radicale](https://radicale.org/v3.html)

## docker-compose.yml

```yml
radicale:
  image: josefilipeferreira/docker-radicale
  container_name: radicale
  ports:
    - "5232:5232"
  # add git versioning to calendar database
  # environment:
    # GIT_AUTHOR_NAME: "your-user-name"
    # EMAIL: "your@email.com"
  volumes:
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
# add git versioning to calendar database
# hook = git add -A && (git diff --cached --quiet || git commit -m "Changes by "%(user)s)
```

## NGINX setup
```
location /radicale/ {
    proxy_pass        http://127.0.0.1:5232/;
    proxy_set_header  X-Script-Name /radicale;
    proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header  Host $http_host;
    proxy_pass_header Authorization;
}
```
