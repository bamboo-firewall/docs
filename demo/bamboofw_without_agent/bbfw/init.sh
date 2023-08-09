#!/usr/bin/bash
calicoctl apply -f ./gnp/db-example.yaml
calicoctl apply -f ./gnp/app-example.yaml
calicoctl apply -f ./gnp/basic-example.yaml
calicoctl apply -f ./gnp/lb-example.yaml
calicoctl apply -f ./hep/192.168.56.5-eth1.yaml
calicoctl apply -f ./hep/192.168.56.11-eth1.yaml
calicoctl apply -f ./hep/192.168.56.12-eth1.yaml
calicoctl apply -f ./hep/192.168.56.21-eth1.yaml
calicoctl apply -f ./hep/192.168.56.22-eth1.yaml
calicoctl apply -f ./hep/192.168.56.31-eth1.yaml
calicoctl apply -f ./hep/192.168.56.32-eth1.yaml
calicoctl apply -f ./gns/black.yaml
calicoctl apply -f ./gns/green.yaml
calicoctl apply -f ./gns/white.yaml
calicoctl apply -f ./gns/gray.yaml
