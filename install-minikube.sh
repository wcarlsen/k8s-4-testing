#!/bin/bash

set -eux

: ${VERSION:=latest}
if [[ "$VERSION" == latest ]] ; then
    VERSION="$( curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt )"
fi

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

mkdir -p $HOME/.kube $HOME/.minikube
touch $HOME/.kube/config

sudo apt-get update -y
sudo apt-get install -y conntrack

minikube config set driver docker
minikube start \
    --extra-config=apiserver.authorization-mode=Node,RBAC \
    --extra-config=apiserver.runtime-config=events.k8s.io/v1beta1=false \
    --kubernetes-version="$VERSION"
