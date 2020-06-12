

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
curl http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

mkdir -p ~/environment/curso/kubernetes/dashboard/
cd ~/environment/curso/kubernetes/dashboard/
kubectl get services --all-namespaces
kubectl edit service kubernetes-dashboard -n kubernetes-dashboard
curl localhost:30010

kubectl apply -f service.yaml 
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')

docker-compose up
