# docker-radicale

docker container for radicale

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

