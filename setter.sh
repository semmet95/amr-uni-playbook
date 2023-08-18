#!/bin/bash
set -ex

## common binary installation directory
mkdir -p ~/.local/bin
cd ~/.local/bin
bin_path=$(pwd)
export PATH=$PATH:$bin_path
cd -

##----------------kubectl installation----------------##

# get the latest version
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl ~/.local/bin/kubectl

# ensure kubectl is installed
kubectl version --client=true

##----------------minikube installation----------------##

# get the latest version
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube-linux-amd64
mv minikube-linux-amd64 ~/.local/bin/minikube

# ensure kubectl is installed
minikube version

##----------------start a minikube cluster---------------##
minikube start --memory 6144 --cpus 3