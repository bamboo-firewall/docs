#!/usr/bin/bash
calicoctl apply -f ./gnp/db-example.yaml
calicoctl apply -f ./gnp/app-example.yaml
calicoctl apply -f ./gnp/basic-example.yaml
calicoctl apply -f ./gnp/lb-example.yaml
calicoctl apply -f ./hep/10.110.3.1-eth0.yaml
calicoctl apply -f ./hep/10.110.1.2-eth0.yaml
calicoctl apply -f ./hep/10.110.2.2-eth0.yaml
calicoctl apply -f ./hep/10.110.2.1-eth0.yaml
calicoctl apply -f ./hep/10.110.1.1-eth0.yaml
calicoctl apply -f ./hep/10.110.3.2-eth0.yaml
calicoctl apply -f ./hep/10.110.8.1-eth0.yaml
calicoctl apply -f ./gns/black.yaml
calicoctl apply -f ./gns/green.yaml
calicoctl apply -f ./gns/white.yaml
calicoctl apply -f ./gns/gray.yaml
