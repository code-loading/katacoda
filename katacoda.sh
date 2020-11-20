#!/bin/bash
#setting up katacoda environment to the lastest kubernetes and minikube version

#update package installer
apt-get update

#install jq to parse json output from 'kubectl version' to get the version that has been installed
apt-get install -y jq


######################################
#installing kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

#make the kubernetes binary executable
chmod +x ./kubectl

#move the binary into your path
sudo mv ./kubectl /usr/local/bin/kubectl

#Test to ensure the version you installed is up-to-date:
kubectl version --client

#########################################
#minikube binary download
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

#install
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#need to start minikube once to get kubectl version
minikube start

#export kubectl client gitVersion to var named KUBE_VER
#tr -d \" is used to remove the quotation marks around the version in the KUBE_VER variable
KUBE_VER=$(kubectl version -o json | jq '. | .serverVersion.gitVersion' | tr -d \")

#set kubectl version in minikube config
minikube config set kubernetes-version $KUBE_VER

#this would make minikube always download whatever version of kubectl is specified, it's better to set it in the minikube config
#start minikube with latest kubernetes version
#minikube start --kubernetes-version=$KUBE_VER

#create alias
alias k=kubectl

#enable completion for kubectl
kubectl completion bash

#set aliases such as k=kubectl to work with completion
echo 'complete -F __start_kubectl k' >>~/.bashrc

#reinitialise shell for completion to work with aliases
. ~/.bashrc

#start minikube
minikube start
