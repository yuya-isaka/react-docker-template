# React, Docker, 開発環境構築

# 必要

- Docker
- docker-compose
- make

# 使い方

## 1. Docker デーモン起動

## 2. フォルダ名変更 (必須)

* Dockerから認識される名前
* react-docker-template -> {template-name}

## 3. フォルダに移動

```shell script
$ cd {template-name}
```

## 4. .git 削除 (必須)

```shell script
$ rm -rf .git
```

## 5. .env ファイルに「プロジェクト名」「コンテナ名」を設定

* 名前はキャメルケースでもスネークケースでも OK
* プロジェクト名は nuxt.js プロジェクトのディレクトリ名にもなる
* コンテナ名はDockerで作られるコンテナの名前


```shell script
.env

PROJECT_NAME=react-project
CONTAINER_NAME=react-container
```

## 6. Docker イメージ，コンテナ & React プロジェクト作成

```shell script
$ make init
```

成功すると下記表示 ↓ 

```shell script
...
...
Success! Created react-project at /work/app/react-project
Inside that directory, you can run several commands:

  yarn start
    Starts the development server.

  yarn build
    Bundles the app into static files for production.

  yarn test
    Starts the test runner.

  yarn eject
    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

We suggest that you begin by typing:

  cd react-project
  yarn start

Happy hacking!
...
...
```

成功しなかったら井阪まで...

## 7. app/{project-name}/package.json のnameを変更 (app/{project-name}と同じ名前にするべし）

## 8. Github プロジェクト作成 (app/{project-name}と同じ名前にするべし)

```
$ cd app/{project-name}
$ git init
$ git add .
$ git commit -m "first commit"
$ git remote {作成したリポジトリ名}
$ git push -u origin master
```

## プロジェクト完成! やったね!

# 開発流れ

## make init 後

```shell script
プロジェクトフォルダに移動（Makefileがあるフォルダ）

$ make up
$ make start

-> app/{project-name}をローカルで開発

* http://localhost で確認
* 本リポジトリ内の`app/`と docker コンテナ内の`/work/app`が同期（ボリュームマウント）

->開発終わり

$ CTRL^C
$ make stop
```

# Docker 操作/一覧

## Nuxt アプリ作成

```shell script
make init
```

## Docker コンテナ起動

```shell script
make up
```

## Docker コンテナ入る & yarn install & yarn dev

```shell script
make start
```

## Docker コンテナ停止

```shell script
make stop
```

## Docker コンテナ確認

```shell script
make ps
```

## Docker コンテナ log 確認

```shell script
make logs
```

## Docker コンテナ入る

```shell script
make in
```

## Docker コンテナ削除

```shell script
make down
```

## Docker コンテナ削除＆再起動

```shell script
make restart
```

## 本一式を廃棄(イメージとコンテナ)

```shell script
make destroy

* このコマンドだけではapp/や本一式の内容物をいきなり削除はしない．
* 自身の手で本一式のディレクトリを削除．
```

## Docker コンテナをイメージから再ビルド

```shell script
make remake
```

## Nuxt アプリ起動

```shell script
make run
```

## Docker 内のプロジェクトで"yarn install"

```shell script
make install
```
