# aws-sam-golang-docker

Boilerplate/Starter Project for building Serverless Lambda functions with AWS SAM, Golang, Docker.

## Features

- AWS SAM
- Golang
- MySQL
- Docker
- Automated packaging and deploying with CircleCI
- Load environment variables from .env files


## Pre Requirements

- [Docker For Mac](https://www.docker.com/docker-mac)


## Getting Started

```bash
git clone https://github.com/okmttdhr/aws-sam-golang-docker.git
cd aws-sam-golang-docker
```

```bash
cp .env.sample .env
```

```bash
docker-compose build
docker-compose up
```



サーバーが立ち上がると、イベントに応じてLambda関数が実行される。
トリガーイベントはjsonを使用して発火することができるが、詳細は下記のリンクを参考にすること。

- [SAM ローカルを使用してサーバーレスアプリケーションをローカルでテストする - AWS Lambda](https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/test-sam-local.html)

#### 例 (API Gatewayがトリガーの場合)

curlなどでAPIにアクセスする。

```bash
curl -H 'Content-Type:application/json' http://localhost:3000 -X POST -d "Paul"
```

### ユニットテスト

```bash
# 全テストを実行
docker-compose run go go test
```

### 環境変数の追加

.envファイルに環境変数を追加することで、ローカル環境では環境変数が読み込まれる。

ただし、CloudFormationでのデプロイ時に環境変数を読み込むために、`template.yml`を以下のように変更する必要がある。

- `Parameters`に値を追加
- `Resources >> 該当のLambda関数 >> Environment`に`!Ref 該当の環境変数名`を追加




## 各環境へのビルド、デプロイ

各種ブランチへのプッシュを行うことで、CircleCIにより該当する環境へのビルド/デプロイが実施される。

- master / ステージング
- release / 本番
