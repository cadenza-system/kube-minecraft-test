最初に確認: Docker Desktop => Resources => WSL integration でUbuntuとdockerを統合

Minikubeを起動

```minikube start```

MinikubeのDocker環境に切り替える

```eval $(minikube docker-env)```

Docker imageのビルド

```docker build -t minecraft-paper-server .```

```docker build -t minecraft-waterfall-server .```

K8Sマニュフェストの適用-起動

```kubectl apply -f minecraft-server-properties.yaml```

```kubectl apply -f minecraft-deployment.yaml```

ポートを外部公開

```kubectl port-forward pod/minecraft-paper-server 25565:25565 &```

削除

``` kubectl delete pods minecraft-paper-server```

podの中に入る

```kubectl exec -it minecraft-paper-server -- /bin/sh```

```kubectl exec -it minecraft-waterfall-server -- /bin/sh```

podの外からminecraftにコマンドを送信
```kubectl exec -it minecraft-paper-server -- mcrcon -H localhost -P 25575 -p root "コマンド"```
