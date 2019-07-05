#!/bin/sh

set -eu

script_dir="$(cd "$(dirname "$0")"; pwd -P)"

if ! kubectl get secret/mysql-pass > /dev/null 2>&1; then
  kubectl create secret generic mysql-pass \
    --from-literal=password="$(head -c 30 /dev/random | base64)"
fi

kubectl apply -f "${script_dir}/mysql-deployment.yml"
kubectl apply -f "${script_dir}/wordpress-deployment.yml"
