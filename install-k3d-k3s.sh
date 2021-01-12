#!/bin/bash

set -eux

: ${VERSION:=latest}

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
k3d cluster create --wait --no-lb --image=rancher/k3s:"${VERSION//+/-}"

# we need to wait until the cluster is fully ready before starting the tests.
while ! kubectl get serviceaccount default >/dev/null; do sleep 1; done