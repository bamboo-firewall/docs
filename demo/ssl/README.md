# Install
[Read the doc](https://github.com/Albertchong/Kubernetes-Tutorials/blob/master/Kubernetes%20Tutorials%2002%20-%20Generate%20Certificate%20for%20ETCD.md)
```shell
cfssl gencert -initca ca-csr.json | cfssljson -bare ca -

echo '{"CN":"etcd-cluster","hosts":[""],"key":{"algo":"rsa","size":2048}}' | cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=peer -hostname="etcd1,etcd2,etcd3,127.0.0.1" - | cfssljson -bare etcd
```
Notes: -hostname argument above command does not have space between hostname