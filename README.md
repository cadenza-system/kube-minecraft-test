最初に確認: Docker Desktop => Resources => WSL integration でUbuntuとdockerを統合

Minikubeを起動

```minikube start```

MinikubeのLBを起動

```minikube tunnel```

MinikubeのDocker環境に切り替える

```eval $(minikube docker-env)```

各サーバーの起動(mock/hogeにcd)

```sh start.sh```

ポートを外部公開

```kubectl port-forward pod/[podname] 25565:25565 &```

podの中に入る

```kubectl exec -it [podname] -- /bin/sh```

podの外からminecraftにコマンドを送信
```kubectl exec -it paper-server -- mcrcon -H localhost -P 25575 -p root "コマンド"```
