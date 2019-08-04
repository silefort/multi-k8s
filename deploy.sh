docker build -t silefort/multi-client -f ./client/Dockerfile ./client
docker build -t silefort/multi-server -f ./server/Dockerfile ./server
docker build -t silefort/multi-worker -f ./worker/Dockerfile ./worker

docker push silefort/multi-client
docker push silefort/multi-server
docker push silefort/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=silefort/multi-server
