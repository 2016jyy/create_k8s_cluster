
kubectl apply -f yaml/traefik.yaml
kubectl apply -f yaml/metrics.yaml
kubectl apply -f yaml/kubernetes-dashboard.yaml


echo """
join command:
  `kubeadm token create --print-join-command`"""

echo """
访问dashboard的url: `kubectl cluster-info | grep kubernetes-dashboard`
token:"""
kubectl describe secret $(kubectl get secret -n kube-system | grep dashboard-admin | awk '{print $1}') -n kube-system | grep token: | awk '{print $2}'
