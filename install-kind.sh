#!/bin/bash

set -eux

: ${KIND:=latest}
: ${VERSION:=latest}
if [[ "$VERSION" == latest ]] ; then
    VERSION="$( curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt )"
fi

curl -Lo ./kind https://kind.sigs.k8s.io/dl/"$KIND"/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/

kind create cluster --image=kindest/node:"$VERSION"