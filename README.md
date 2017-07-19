# Abstract

A simple installer that wraps the kubeadm utility to install a single-node
Kubernetes cluster on CentOS or Ubuntu.

Mostly useful for POC and demos where using minikube isn't possible.

# Prerequisites

**Supported OS**: CentOS 7.x, Ubuntu 16.x 17.x

**Docker**: v1.10, 1.11, 1.12 (recommended)

# Execution

Just run the `installer` script and wait a few minutes until Kubernetes control
plane components will start properly.

```
curl -L https://github.com/codefresh-io/k8s-single-node-installer/archive/master.tar.gz | tar xvz
cd k8s-single-node-installer-master
sudo chmod +x installer
sudo ./installer
```

You can check the progress with `docker ps` and `journal -fu kubelet` commands.

