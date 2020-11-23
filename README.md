# katacoda

A shell script to run on katacoda to download the latest kubectl, latest minikube and start minikube with the newest kubectl, and enable autocompletion with alias k=kubectl. Kind of a hacky solution but it works.

Go to https://www.katacoda.com/courses/kubernetes/launch-single-node-cluster then copy paste the following block into the terminal using Ctrl+Shift+V and then press enter:

```
git clone https://github.com/code-loading/katacoda
cd katacoda
chmod +x katacoda.sh
. katacoda.sh
```
Wait to see the message "Have fun with kubernetes!! :)" before you start using it
You could try out this tutorial to get your feet wet with kubernetes: https://kubernetes.io/docs/tutorials/kubernetes-basics/
