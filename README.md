# Realworld

これは[WEB+DB PRESS Vol.127](https://gihyo.jp/magazine/wdpress/archive/2022/vol127)の特集「Elixirによる高速なWeb開発！　作って学ぶPhoenix」のサンプルコードです。

![表紙画像](https://user-images.githubusercontent.com/4215723/152686942-be6d5ffd-fe7b-4a0d-9e38-c264705c182b.jpeg)

## ローカルマシンで動かす

ローカルマシン上で直接、サンプルコードを動かす場合の手順です。

macOS Catalina(10.15.7)、macOS Monterey(12.2)で動作することを確認しています。

### 必要なもの

事前に必要なものは次の2点です。

- Elixir 1.13 or later
- Erlang 24.0 or later
- PostgreSQL 13 or later

詳しくは、[WEB+DB PRESS Vol.127](https://gihyo.jp/magazine/wdpress/archive/2022/vol127)の特集「Elixirによる高速なWeb開発！　作って学ぶPhoenix」をご参照ください。


### 環境構築

環境構築は次の通りです。

```
$ git clone https://github.com/elixirjp-slack-com/realworld.git
$ cd realworld
$ mix setup
```

### Run

実行は、次のコマンドにより行います。

```
$ mix phx.server
```

http://localhost:4000/articles
にアクセスをしてください。

### テスト

テストは、次のコマンドにより実施できます。

```
$ mix test
```

---

## [Docker](https://www.docker.com/)上で動かす

ローカルマシンに、インストールした[Docker](https://www.docker.com/)上で「すべて」を動かす手順です。

ここで言う「すべて」とは、Elixir、Phoenix、PostgreSQLを指します。

以下の環境で動作することを確認しています。

- macOS Monterey(12.2)、macOS Catalina(10.15.7)
  - Docker Desktop 4.4.2
- Windows 11 Home(バージョン 21H2, OS ビルド 22000.434)
  - Docker Desktop 4.4.4

### 必要なもの

事前に必要なものは、[Docker](https://www.docker.com/)のみです。


### 環境構築

環境構築は次の通りです。

```
$ git clone https://github.com/elixirjp-slack-com/realworld.git
$ cd realworld
$ docker-compose build --no-cache
```

### Run

実行は、次のコマンドにより行います。

```
$ docker-compose up -d
```

http://localhost:4000/articles
にアクセスをしてください。

### テスト

テストは、次のコマンドにより実施できます。

```
$ docker-compose run --rm web mix test
```

### Stop

次のコマンドで停止できます。

```
$ docker-compose stop
```

---

## 本番運用したい

[deployment guides](https://hexdocs.pm/phoenix/deployment.html)をご参照ください。

## もっと学びたい

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## [elixirjp.slack.com](https://join.slack.com/t/elixirjp/shared_invite/zt-ae8m5bad-WW69GH1w4iuafm1tKNgd~w)

[elixirjp.slack.com](https://join.slack.com/t/elixirjp/shared_invite/zt-ae8m5bad-WW69GH1w4iuafm1tKNgd~w)に、執筆陣はおります。

ぜひ飛び込んできてください。

あなたの参加を熱烈歓迎いたします:tada:

## 2022/3/6追記

以下のコマンドでPhoenix1.6コンテナ環境を構築できます。

```
curl -L -o temp.zip https://github.com/naritomo08/realworld-1/archive/refs/heads/naritomo-devlop.zip
unzip temp.zip
rm temp.zip
mv realworld-1-naritomo-devlop ex-v03
cd ex-v03

sudo bin/setup.sh
sudo bin/start.sh
sudo bin/login.sh
```

本環境でのサンプルアプリ立ち上げ

```
cd realworld-kansei
./entrypoint.sh
または
mix ecto.reset
mix phx.server
```

以下のURLサイトを参照する。

http://localhost:4000/articles

にアクセスをしてください。

プロジェクト導入後、以下の変更は実施すること。

config/dev.exs

7行目
  hostname: "db",


21行目
  http: [ip: {0, 0, 0, 0}, port: 4000],

config/test.exs

11行目
  hostname: "db",

## 2022/3/6追記その2

gigalixirによるデプロイ方法

  * DBはpostgresqlで作っていること。
  * 作業対象フォルダに対し、git commitしていること
  * 作業前にbranchからmainにマージすること。(別ブランチで作成している場合)
  * mainに切り替えておくこと。(別ブランチで作成している場合)
  * gigalixirサイトで登録を実施しておくこと。
https://www.gigalixir.com/
  * 無料プランの場合、appが1つしか立ち上げられない。
  * 何かソース自体更新しておく必要がある。

2回目以降のデプロイは,1→7(9)→10の作業でデプロイ可能。

コンテナ自体再立ち上げした際は全項目実施。

本作業はコンテナ内で実施しなくてもよい。

ホスト側で行う場合、初回実施以降1の作業は必要なし。

1 gigalixirCLIインストール(gigalixirコマンド使えない場合)

```
sudo apt-get update
sudo apt-get install -y python3 python3-pip git-core curl

pip3 install gigalixir --user
```

```
*失敗した場合
-----------------------------------
pip3 show cryptography

Location:を確認し、その中に入る該当名フォルダを削除

pip3 install --upgrade pip

pip3 install gigalixir --user
-----------------------------------
```

```
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

gigalixir
→コマンドが使えることを確認する。
```

```
*再コンテナログイン時など、2回目以降にgigalixirコマンドを使用できない場合、以下のコマンドを入力する。
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

gigalixir
→コマンドが使えることを確認する。
```

2 gigalixirログイン設定(すでに設定済みの場合不要)

```
gigalixir login

gigalixir account
```

3 gigalixirアプリ作成

```
gigalixir create -n {unique_name}
*-nパラメータは入れなくてもよい。

gigalixir apps
→unique_nameを控える。
```

4 DB作成(必要に応じ)

gigalixir pg:create --free -a {unique_name}

5 デプロイソース準備(初回のみ)

```
elixir -v
node -v

echo "elixir_version=1.12.3(Elixirバージョン)" > elixir_buildpack.config
echo "erlang_version=24.0(Erlandバージョン)" >> elixir_buildpack.config
echo "node_version=14.17.6(nodeバージョン)" > phoenix_static_buildpack.config

vi config/prod.exs

12行目あたり。

config :piyopiyoex3_sample_portfolio, Piyopiyoex3SamplePortfolioWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"
#　↓ 書き換える
config :sample_portfolio, SamplePortfolioWeb.Endpoint,
  url: [host: "{アプリのunique_name}.gigalixirapp.com"],
  check_origin: ["//{アプリのunique_name}.gigalixirapp.com"],
  cache_static_manifest: "priv/static/cache_manifest.json"

作業実施後、コミットも実施すること。
```

6 git準備

```
gigalixir git:remote {unique_name}

git remote -v
→gigalixir登録がされていること。
```

7 appデプロイ

```
git push gigalixir main
→エラーなく動くこと。
```

8 ssh公開鍵設定(DBを使う場合、初回(コンテナ立ち上げ時)のみ)

```
ssh-keygen -t rsa
→すべての問いに対し[Enter]をする。

cat ~/.ssh/id_rsa.pub
→表示されるssh公開鍵文字列を控える。
→ファイルがない場合、前の手順に戻って作成すること。

gigalixir account:ssh_keys:add "【ssh公開鍵文字列】"

gigalixir account:ssh_keys
→公開鍵が表示されることを確認する。
→前使用したキーもある場合、管理画面から削除すること。
```

9 DBマイグレート(必要に応じ)

```
初回:
gigalixir run mix ecto.migrate
gigalixir run mix run priv/repo/seeds.exs

2回目以降：
gigalixir run mix ecto.reset

gigalixir logs
→DBの状況を確認する。
```

10 サイト確認

```
gigalixir ps
→アプリのステータスがHealthyになること。

gigalixir open
→出てきたURLのサイトを参照できること。
　gigalixirサイトからURL参照可能。
```

## 2022/3/6追記その2

gigaklixirサイト削除

＊予めgigalixirコマンドを使用できるようにすること。

1 appステータス確認

```
gigalixirサイトでapp,DB状態を確認する。
https://www.gigalixir.com/

アプリ名(unique_name)を控える。
```

2 DB削除(DB利用の場合)

```
gigalixir ps:scale --replicas=0 -a {unique_name}

gigalixir管理画面からDBを削除する。
```

3 app削除

```
gigalixir ps:scale --replicas=0 -a {unique_name}
→2の作業をしていない場合、上記のコマンドを入力。

gigalixir管理画面からappを削除する。
```

4 gitリポジトリ設定削除

```
git remote remove gigalixir

git remote -v
→gitのgigalixir登録が消えていること。
```


