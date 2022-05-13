# chrono @ 2022-05

# https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner

# docker pull k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
# docker pull chronolaw/nfs-subdir-external-provisioner:v4.0.2

#kubecal apply -f rbac.yaml
#kubecal apply -f class.yaml
#kubecal apply -f deployment.yaml

# change namespace
#   default => kube-system
sed 's/default/kube-system/g' rbac.yaml | \
  kubectl apply -f -

kubectl apply -f class.yaml

# change: namespace/image/NFS_SERVER/NFS_PATH
#   default => kube-system
#   k8s.gcr.io/sig-storage => chronolaw
#   10.3.243.101 => 192.168.10.208
#   /ifs/kubernetes => /tmp/nfs
sed 's/default/kube-system/g' deployment.yaml | \
  sed 's/k8s.gcr.io\/sig-storage/chronolaw/g' | \
  sed 's/10.3.243.101/192.168.10.208/g' | \
  sed 's/\/ifs\/kubernetes/\/tmp\/nfs/g' | \
  kubectl apply -f -

