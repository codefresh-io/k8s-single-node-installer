# Abstract

AMI based on Ubuntu and include installed docker 1.12.6, pulled images and cloud-init script
/etc/cloud/cloud.cfg.d/99_kubeadm_init.cfg

# Adjusting git branch
If you want to download scripts from certain branch set:
```
BRANCH=<your_branch>
```

# Development
Start instance from ami and add to user-data:
```
MAINTENANCE_MODE=true
```
 this will prevent instance provisioning

If you want to use helm chart from dev channel add to user-data:
```
CF_HELM_CHANNEL=dev
```

**IMPORTANT**
After changing AMI use script /home/ubuntu/ami_cleanup.sh to clean ami.

