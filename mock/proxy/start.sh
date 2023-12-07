
echo '[info] docker build -t waterfall-server .'
docker build -t waterfall-server .

echo 'kubectl delete deployment waterfall-server
'
kubectl delete deployment waterfall-server

echo '[info] kubectl apply -f waterfall-config.yaml'
kubectl apply -f waterfall-config.yaml

echo '[info] kubectl apply -f waterfall-deployment.yaml'
kubectl apply -f waterfall-deployment.yaml

echo '[info] kubectl apply -f loadBalancer.yaml'
kubectl apply -f loadBalancer.yaml
