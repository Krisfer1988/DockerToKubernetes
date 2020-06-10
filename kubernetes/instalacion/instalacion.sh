# Requisitos

# R1: docker <- cgroups NO -> SI systemd
#  --exec-opt native.cgroupdriver=systemd en dockerd al arrancar servicio de docker

# R2: Desactivar swapping
sudo swapoff -a
sudo vim /etc/fstab
free # comprobar con free que no hay swap

# Pasos
# Paso 1: Alta del repo de kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update

# Paso 2: Instalar kubeadm
sudo apt-get install kubeadm -y
kubeadm version # comprobar la instalación

# Paso 3: Crear cluster con kubeadm
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
# Hay varias lineas que debemos ejecutar qye salen como resultado del init
#  mkdir -p $HOME/.kube
#  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#  sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Para añadir otras maquinas al cluster, ejecutar: (sale también del init)
  #kubeadm join 172.31.31.168:6443 --token badbhg.ekjdi0muuw47vca0 \
  #    --discovery-token-ca-cert-hash sha256:79c24a7e581f18170f6076b108f49fca1383fe44ab5bf6e8a75cd0ca9250c407 
  
kubectl get nodes   # Compruebo que mi cluster está instalado y que tiene su maestro
kubectl get pods    # Lista los pods del cluster los del namespace por defecto
kubectl get pods --all-namespaces # Lista todos los pods
kubectl get pod -n kube-system  # Listar los pods de un namespace

# Describir un pod que tengo en el cluster
kubectl describe pod coredns-66bff467f8-8klz5 -n kube-system       

# Configurar driver de red para los pods (indicado en el init)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Activar autocompletado para kubernetes: https://kubernetes.io/docs/reference/kubectl/cheatsheet/
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.


# Para JUGAR y poder instalar cosas en el nodo maestro:
kubectl taint nodes --all node-role.kubernetes.io/master-
# EN PROD NOOOOOOO !!!!!!!!!
