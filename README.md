# docker-elixir

A Dockerfile to build an Elixir image.

Currently installs:

* Erlang/OTP 17.1
* Elixir 1.0.0

Available on Docker Hub as `cargosense/elixir`

## Developing

After making changes to `Dockerfile`, build the image:

```
$ docker build -t cargosense/elixir .
```

Test Elixir:

```
docker run -i -t cargosense/elixir /bin/bash
root@b51dc1549f5b:/# iex
Erlang/OTP 17 [erts-6.1] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]
Interactive Elixir (1.0.0-rc1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Push the image:

```
$ docker push cargosense/elixir
```

## Credit

Based on:

* https://github.com/obmarg/docker-elixir
* https://github.com/binarin/docker-elixir
