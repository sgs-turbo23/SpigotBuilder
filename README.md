# SpigotBuilder
Minecraftサーバー用ソフト、Spigotの最新版を作成するdocker image

[![Publish Docker image](https://github.com/sgs-turbo23/SpigotBuilder/actions/workflows/docker.yml/badge.svg?branch=main&event=push)](https://github.com/sgs-turbo23/SpigotBuilder/actions/workflows/docker.yml)

## 使用方法

docker for Windowsが稼働している状態で、Powershellで以下コマンドを実行してください
```
docker login ghcr.io -u <githubアカウント> -p <アクセストークン>
$cd = Convert-Path .
docker run -it --mount type=bind,source=$cd,target=/bind ghcr.io/sgs-turbo23/spigot_build:latest
```
処理が完了すると、カレントディレクトリに`spigot.*.jar`が作成されます。


## デプロイ方法

レジストリは以下となります。
`ghcr.io/sgs-turbo23/spigot_build`

以下のファイルをpushすると、github-actionsでimageがGithub Container Packageへpushされます

- Dockerfile
- command.sh

手動でpushする場合は、ghcr.ioへのログインが必要となります

```
docker login ghcr.io -u <githubアカウント> -p <アクセストークン>
docker build -t ghcr.io/sgs-turbo23/spigot_build .
docker push ghcr.io/sgs-turbo23/spigot_build:latest
docker logout ghcr
```


## メンテナンス

github-acitonsにおけるGithub Container Packageへのログインはこのリポジトリのsecretで管理しています
期限切れがある場合、`package writer`の権限でPrivate Access Tokenを作り直してください
