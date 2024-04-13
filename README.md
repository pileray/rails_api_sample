# 環境構築

``` 
$ docker compose build
$ docker compose run --rm web bin/setup
$ docker compose up
```
http://localhost:3000/up にアクセス。緑の画面が出ればOK。

[![Image from Gyazo](https://i.gyazo.com/1dc1e6d8500531c189bf09d524ce08f5.png)](https://gyazo.com/1dc1e6d8500531c189bf09d524ce08f5)

開発する時は
```
$ docker compose exec web bash
```
でコンテナの中に入って作業をしてください。
