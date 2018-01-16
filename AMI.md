# Abstract

AMI based on Ubuntu and include installed docker 1.12.6, pulled images and cloud-init script
/etc/cloud/cloud.cfg.d/99_kubeadm_init.cfg

# Development
Start instance from ami and add to user-data "maintenance_mode", this will prevent instance provisioning

If you want to use helm chart from dev channel, add to user-data "dev"

**IMPORTANT**
After changing AMI use script /home/ubuntu/ami_cleanup.sh to clean ami.

