
echo '[info] docker build -t paper-server .'
docker build -t paper-server .

echo 'kubectl delete pod hub'
kubectl delete pod suvival

echo 'kubectl delete service suvival-ip-service'
kubectl delete service suvival-ip-service

echo '[info] kubectl apply -f server-properties.yaml'
kubectl apply -f server-properties.yaml

echo '[info] kubectl apply -f spigot.yaml'
kubectl apply -f spigot.yaml

echo '[info] kubectl apply -f paper-deployment.yaml'
kubectl apply -f paper-deployment.yaml

echo '[info] kubectl apply -f paper-service.yaml'
kubectl apply -f paper-service.yaml
