#查看etcd是否需健康
```bash
export ETCDCTL_API=3
etcdctl  --endpoints=https://127.0.0.1:2379   --cert=/etc/kubernetes/pki/etcd/server.crt  --cacert=/etc/kubernetes/pki/etcd/ca.crt  --key=/etc/kubernetes/pki/etcd/server.key    endpoint status 
```

#列出etcd内容
```bash
export ETCDCTL_API=3
etcdctl  --endpoints=https://127.0.0.1:2379   --cert=/etc/kubernetes/pki/etcd/server.crt  --cacert=/etc/kubernetes/pki/etcd/ca.crt  --key=/etc/kubernetes/pki/etcd/server.key    get / --prefix --keys-only 
```

