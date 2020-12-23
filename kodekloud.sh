#!/bin/bash
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash >/etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc
. ~/.bashrc
cp ~/.vimrc vimrc
rm ~/.vimrc
echo "set sts=2 ts=2 sw=2 et number" > ~/.vimrc && . ~/.vimrc
alias kcf="kubectl create -f "
alias kgp="kubectl get pods"
alias kdp="kubectl delete po --force --grace-period=0"
alias kg="kubectl get"
export nw="--force --grace-period=0"
export do="--dry-run=client -o yaml"
alias c=clear
cd ..
