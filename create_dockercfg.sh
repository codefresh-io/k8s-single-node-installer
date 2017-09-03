#!/usr/bin/env bash

msg() { echo -e "\e[32mINFO ---> $1\e[0m"; }
err() { echo -e "\e[31mERR ---> $1\e[0m" ; exit 1; }

customer=$1

if [ ! -f ${customer}.json ]; then
    err "File ${customer}.json not found!"
fi

minikube profile ${customer}

minikube start

kubectl create secret docker-registry dockercfg \
          --docker-server=https://gcr.io \
          --docker-username=_json_key \
          --docker-password="$(cat ${customer}.json)" \
          --docker-email=cf-onprem-${customer}@codefresh-enterprise.iam.gserviceaccount.com

kubectl get secret dockercfg -oyaml | grep 'dockercfg:' > dockercfg-${customer}.base64

msg "secret encoded, check dockercfg-${customer}.base64 file"

#cleanup
minikube delete
minikube profile minikube
kubectl config delete-context ${customer}