# docker-elixir

Based on https://github.com/CargoSense/docker-elixir

Dockerfile to build an Elixir image.

Currently installs:

* Erlang/OTP 18.2.1
* Elixir 1.2.0 (with mix)

Available on Docker Hub as `hekar/elixir`

## Use in Dockerfile

```
FROM hekar/elixir

ENTRYPOINT ['...']
```

## Build Locally

After making changes to `Dockerfile`, build the image:

```
$ docker build -t hekar/elixir .
```

Test Elixir:

```
docker run -i -t hekar/elixir /bin/bash
> mix new project && cd project
> iex -S mix
```

Push the image:

```
$ docker push hekar/elixir
```
