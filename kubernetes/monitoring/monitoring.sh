cd ~/environment/curso/kubernetes/monitoring/
kubectl apply -f kubestate/
kubectl get deployments kube-state-metrics -n kube-system

kubectl create namespace monitoring
kubectl apply -f clusterRole.yaml 
kubectl apply -f configMap.yaml 
kubectl apply -f prometheus.yaml 
kubectl get deployments --namespace=monitoring
kubectl apply -f service.yaml 
kubectl apply -f service.yaml -n monitoring 

cd grafana
kubectl apply -f grafana.yaml 

