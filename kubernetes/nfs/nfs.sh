sudo apt install nfs-kernel-server
sudo mkdir -p /mnt/kubernetes
sudo chown nobody:nogroup /mnt/kubernetes/
sudo chmod 777 /mnt/kubernetes/
sudo vim /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
sudo ufw allow from 172.0.0.0/24 to any port nfs
showmount -e 

mkdir -p ~/environment/kubernetes/nfs/

cd ~/environment/kubernetes/nfs/
git clone https://exxsyseng@bitbucket.org/exxsyseng/nfs-provisioning.git
cd nfs-provisioning
kubectl create -f rbac.yaml
kubectl get clusterrole,clusterrolebinding,role,rolebinding | grep nfs
kubectl apply -f provisioner.yaml 

cd ~/environment/kubernetes/nfs/
kubectl get all

kubectl get sc,pv,pvc
kubectl apply -f storageclass.yaml 
kubectl apply -f ejemplo.yaml 

kubectl get sc,pv,pvc
kubectl describe  pod/nfs-client-provisioner-6b88d89466-fzhn5

kubectl get sc,pv,pvc

kubectl exec -it pod/pruebanfs -- bash

kubectl delete -f ejemplo.yaml 
kubectl get pv,pvc,sc


clear
kubectl get nodes
kubeadm token create
kubectl get nodes



