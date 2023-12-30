echo '[info] docker build -t paper-server .'
docker build -t paper-server .
minikube image load paper-server

echo '[info] Deleting old resources...'
kubectl delete deployment hub
kubectl delete service hub-ip-service

echo '[info] Applying ConfigMaps...'
kubectl apply -f server-properties.yaml
kubectl apply -f spigot.yaml

echo '[info] Creating PV and PVC...'
kubectl apply -f paper-pv.yaml
kubectl apply -f paper-pvc.yaml

echo '[info] Applying Deployment and Service...'
kubectl apply -f paper-deployment.yaml
kubectl apply -f paper-service.yaml
