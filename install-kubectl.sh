#!/bin/bash

set -eux

: ${VERSION:=latest}
if [[ "$VERSION" == latest ]] ; then
    VERSION="$( curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt )"
fi

curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/"$VERSION"/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/