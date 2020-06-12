cd ..
kubectl apply -f kube-state/
kubectl get deployments kube-state-metrics -n kube-system


cd ~/environment/curso/kubernetes/monitoring/
kubectl apply -f clusterRole.yaml 
kubectl apply -f configMap.yaml 
kubectl apply -f prometheus.yaml 
kubectl get deployments --namespace=monitoring
kubectl apply -f service.yaml 
kubectl apply -f service.yaml -n monitoring 

cd grafana
kubectl apply -f grafana.yaml 

