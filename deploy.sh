docker build -t silefort/multi-client:latest  -t silefort/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t silefort/multi-server:latest  -t silefort/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t silefort/multi-worker:latest  -t silefort/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push silefort/multi-client:latest
docker push silefort/multi-server:latest
docker push silefort/multi-worker:latest

docker push silefort/multi-client:$SHA
docker push silefort/multi-client:$SHA
docker push silefort/multi-client:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=silefort/multi-client:$SHA
kubectl set image deployments/server-deployment server=silefort/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=silefort/multi-worker:$SHA
