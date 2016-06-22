# docker-go-migrate
A containerized version of the GoLang migrate utility by mattes

Note: It works, but the examples aren't great at the moment partially because of needing to specify the host name and such.

```
docker run --rm -e HOST=dockerhost --add-host=dockerhost:172.17.0.1 deinspanjer/migrate -all version
```
